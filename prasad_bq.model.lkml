connection: "biquery_publicdata_standard_sql"

# include all the views
include: "*.view"

label: "1. Machine Learning"

datagroup: prasad_bq_default_datagroup {
   max_cache_age: "1 hour"
  sql_trigger: SELECT CURRENT_DATE() ;;
}

persist_with: prasad_bq_default_datagroup

explore: world_view {}

#### ML - Logistics Regression #####
explore: transactions_training_model_info {
  label: "Model Info"
}
explore: logistics_reg_model_evaluation {label: "Model Evaluations"}
explore: transactions_prediction {label: "Purchase Predictions"}
