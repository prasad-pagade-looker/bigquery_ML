####### Input tables ############################s
view: input_training_data {
  derived_table: {
    sql: SELECT
        IF(totals.transactions IS NULL, 0, 1) AS label,
        IFNULL(device.operatingSystem, "") AS os,
        device.isMobile AS is_mobile,
        IFNULL(geoNetwork.country, "") AS country,
        IFNULL(totals.pageviews, 0) AS pageviews
      FROM
        `bigquery-public-data.google_analytics_sample.ga_sessions_*`
      WHERE
        _TABLE_SUFFIX BETWEEN '20160801' AND '20170630'
       ;;
      datagroup_trigger: prasad_bq_default_datagroup
  }

  measure: count { type: count
    drill_fields: [detail*]
  }

  dimension: will_purchase {
    type: number
    sql: ${TABLE}.will_purchase ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: is_mobile {
    type: string
    sql: ${TABLE}.is_mobile ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  set: detail {
    fields: [will_purchase, os, is_mobile, country, pageviews]
  }
}

####### Create ML Model ##########################
view: transactions_regression {
  derived_table: {
    datagroup_trigger: prasad_bq_default_datagroup
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(model_type='logistic_reg'
--        , labels=['will_purchase']
--      , eval_split_method='no_split'
        ) AS
      SELECT
         *
      FROM ${input_training_data.SQL_TABLE_NAME}
      LIMIT 100000;;
  }
}

######## Training Info ############################

view: transactions_training_model_info {
  derived_table: {
    sql: SELECT
        *
      FROM
        ML.TRAINING_INFO(MODEL ${transactions_regression.SQL_TABLE_NAME} )
       ;;
  }
  dimension: training_run {type: number}
  dimension: iteration {type: number}
  dimension: loss_raw {sql: ${TABLE}.loss;; type: number hidden:yes}
  dimension: eval_loss {type: number}
  dimension: duration_ms {label:"Duration (ms)" type: number}
  dimension: learning_rate {type: number}
  measure: total_iterations {
    type: count
  }
  measure: loss {
    value_format_name: decimal_2
    type: sum
    sql:  ${loss_raw} ;;
  }
  measure: total_training_time {
    type: sum
    label:"Total Training Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  measure: average_iteration_time {
    type: average
    label:"Average Iteration Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }

}

######### Evaluate ML Model #########################

view: logistics_reg_model_evaluation {
  derived_table: {
    sql: SELECT
        *
      FROM
        ML.EVALUATE(MODEL ${transactions_regression.SQL_TABLE_NAME} , (SELECT
              IF(totals.transactions IS NULL, 0, 1) AS label,
              IFNULL(device.operatingSystem, "") AS os,
              device.isMobile AS is_mobile,
              IFNULL(geoNetwork.country, "") AS country,
              IFNULL(totals.pageviews, 0) AS pageviews
            FROM
              `bigquery-public-data.google_analytics_sample.ga_sessions_*`
            WHERE
              _TABLE_SUFFIX BETWEEN '20160801' AND '20170630'

        ))
       ;;
  }
  dimension: precision {
    type: number
    sql: ${TABLE}.precision ;;
    value_format_name: percent_2
  }
  dimension: recall {
    type: number
    sql: ${TABLE}.recall ;;
    value_format_name: percent_2
  }
  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
    value_format_name: percent_2
  }
  dimension: f1_score {
    type: number
    sql: ${TABLE}.f1_score ;;
    value_format_name: percent_2
  }
  dimension: log_loss {
    type: number
    sql: ${TABLE}.log_loss ;;
    value_format_name: decimal_2
  }
  dimension: roc_auc {
    type: number
    sql: ${TABLE}.roc_auc ;;
    value_format_name: decimal_2
  }

}


######## Predictions #################################
view: transactions_prediction {
  derived_table: {
    sql: SELECT * FROM ml.PREDICT(
          MODEL ${transactions_regression.SQL_TABLE_NAME} ,
          (SELECT * FROM ${input_training_data.SQL_TABLE_NAME} ))
 ;;
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }
  dimension: predicted_label {
    type: number
    sql: ${TABLE}.predicted_label ;;
  }
  dimension: predicted_label_probs {
    type: string
    sql: ${TABLE}.predicted_label_probs ;;
  }
  dimension: label {
    type: number
    sql: ${TABLE}.label ;;
  }
  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }
  dimension: is_mobile {
    type: string
    sql: ${TABLE}.is_mobile ;;
  }
  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }
  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }
  measure: will_purchase {
    type: max
    sql: ${predicted_label} ;;
  }
  set: detail {
    fields: [
      predicted_label,
      predicted_label_probs,
      label,
      os,
      is_mobile,
      country,
      pageviews
    ]
  }
}
