view: world_view {
  sql_table_name: trump_effect_2017_01.data_US ;;

  dimension: _aud__media_print_hours {
    type: string
    sql: ${TABLE}._aud__media_print_hours ;;
  }

  dimension: _aud__media_radio_hours {
    type: string
    sql: ${TABLE}._aud__media_radio_hours ;;
  }

  dimension: _aud__media_tv_hours {
    type: string
    sql: ${TABLE}._aud__media_tv_hours ;;
  }

  dimension: _aud__member_organization {
    type: string
    sql: ${TABLE}._aud__member_organization ;;
  }

  dimension: _aud__online_sharing_frequency {
    type: string
    sql: ${TABLE}._aud__online_sharing_frequency ;;
  }

  dimension: _aud__organization_activities_timeperweek {
    type: string
    sql: ${TABLE}._aud__organization_activities_timeperweek ;;
  }

  dimension: _aud__sharing_network_size {
    type: string
    sql: ${TABLE}._aud__sharing_network_size ;;
  }

  dimension: _aud__social_media_activity_rank {
    type: string
    sql: ${TABLE}._aud__social_media_activity_rank ;;
  }

  dimension: _aud__social_networks_regularly_used {
    type: string
    sql: ${TABLE}._aud__social_networks_regularly_used ;;
  }

  dimension: _dem__age {
    type: number
    sql: ${TABLE}._dem__age ;;
  }

  dimension: _dem__change_economy_country_past12months {
    type: string
    sql: ${TABLE}._dem__change_economy_country_past12months ;;
  }

  dimension: _dem__change_household_finances_next12months {
    type: string
    sql: ${TABLE}._dem__change_household_finances_next12months ;;
  }

  dimension: _dem__country_code {
    type: string
    sql: ${TABLE}._dem__country_code ;;
  }

  dimension: _dem__degree_of_urbanisation {
    type: string
    sql: ${TABLE}._dem__degree_of_urbanisation ;;
  }

  dimension: _dem__disposable_income {
    type: string
    sql: ${TABLE}._dem__disposable_income ;;
  }

  dimension: _dem__economy_country_next12months {
    type: string
    sql: ${TABLE}._dem__economy_country_next12months ;;
  }

  dimension: _dem__education_level {
    type: string
    sql: ${TABLE}._dem__education_level ;;
  }

  dimension: _dem__employment_status {
    type: string
    sql: ${TABLE}._dem__employment_status ;;
  }

  dimension: _dem__employment_status_in_education {
    type: string
    sql: ${TABLE}._dem__employment_status_in_education ;;
  }

  dimension: _dem__ethnicity {
    type: string
    sql: ${TABLE}._dem__ethnicity ;;
  }

  dimension: _dem__financial_security {
    type: string
    sql: ${TABLE}._dem__financial_security ;;
  }

  dimension: _dem__gender {
    type: string
    sql: ${TABLE}._dem__gender ;;
  }

  dimension: _dem__hometown {
    type: yesno
    sql: ${TABLE}._dem__hometown ;;
  }

  dimension: _dem__household_finances_past12months {
    type: string
    sql: ${TABLE}._dem__household_finances_past12months ;;
  }

  dimension: _dem__household_size {
    type: string
    sql: ${TABLE}._dem__household_size ;;
  }

  dimension: _dem__immigration {
    type: string
    sql: ${TABLE}._dem__immigration ;;
  }

  dimension: _dem__income_net_monthly {
    type: string
    sql: ${TABLE}._dem__income_net_monthly ;;
  }

  dimension: _dem__job_security {
    type: string
    sql: ${TABLE}._dem__job_security ;;
  }

  dimension: _dem__lgbtq {
    type: string
    sql: ${TABLE}._dem__lgbtq ;;
  }

  dimension: _dem__origin {
    type: string
    sql: ${TABLE}._dem__origin ;;
  }

  dimension: _dem__religion {
    type: string
    sql: ${TABLE}._dem__religion ;;
  }

  dimension: _dem__residency {
    type: string
    sql: ${TABLE}._dem__residency ;;
  }

  dimension: _dem__settlement_size {
    type: string
    sql: ${TABLE}._dem__settlement_size ;;
  }

  dimension: _dem__status_national_economy {
    type: string
    sql: ${TABLE}._dem__status_national_economy ;;
  }

  dimension: _dem__work_type_manual {
    type: string
    sql: ${TABLE}._dem__work_type_manual ;;
  }

  dimension: _dem__work_type_routine {
    type: string
    sql: ${TABLE}._dem__work_type_routine ;;
  }

  dimension: _meta__uuid {
    type: string
    sql: SUBSTR(${TABLE}._meta__uuid,1,7) ;;
  }

  dimension: _meta__weight {
    type: number
    sql: ${TABLE}._meta__weight ;;
  }

  dimension: _question__consideration_or_good_behaviour {
    type: string
    sql: ${TABLE}._question__consideration_or_good_behaviour ;;
  }

  dimension: _question__conspiracy {
    type: string
    sql: ${TABLE}._question__conspiracy ;;
  }

  dimension: _question__country_comes_first {
    type: string
    sql: ${TABLE}._question__country_comes_first ;;
  }

  dimension: _question__country_direction_past5years {
    type: string
    sql: ${TABLE}._question__country_direction_past5years ;;
  }

  dimension: _question__curiosity_or_good_manners {
    type: string
    sql: ${TABLE}._question__curiosity_or_good_manners ;;
  }

  dimension: _question__currentplace_change_past5years {
    type: string
    sql: ${TABLE}._question__currentplace_change_past5years ;;
  }

  dimension: _question__democracy_own_country_satisfaction {
    type: string
    sql: ${TABLE}._question__democracy_own_country_satisfaction ;;
  }

  dimension: _question__family_friends_highereducation {
    type: string
    sql: ${TABLE}._question__family_friends_highereducation ;;
  }

  dimension: _question__financial_situation_change_past5years {
    type: string
    sql: ${TABLE}._question__financial_situation_change_past5years ;;
  }

  dimension: _question__frequency_of_voting {
    type: string
    sql: ${TABLE}._question__frequency_of_voting ;;
  }

  dimension: _question__frequent_sharing_of_politicalviews {
    type: string
    sql: ${TABLE}._question__frequent_sharing_of_politicalviews ;;
  }

  dimension: _question__gender_discrimination_importance {
    type: string
    sql: ${TABLE}._question__gender_discrimination_importance ;;
  }

  dimension: _question__government_controlled_by_elite {
    type: string
    sql: ${TABLE}._question__government_controlled_by_elite ;;
  }

  dimension: _question__hometown_change_past5years {
    type: string
    sql: ${TABLE}._question__hometown_change_past5years ;;
  }

  dimension: _question__important_issues_when_voting {
    type: string
    sql: ${TABLE}._question__important_issues_when_voting ;;
  }

  dimension: _question__improving_life_by_hardwork {
    type: string
    sql: ${TABLE}._question__improving_life_by_hardwork ;;
  }

  dimension: _question__independence_or_respect {
    type: string
    sql: ${TABLE}._question__independence_or_respect ;;
  }

  dimension: _question__international_trade_gain_or_loss {
    type: string
    sql: ${TABLE}._question__international_trade_gain_or_loss ;;
  }

  dimension: _question__likelihood_to_demonstrate {
    type: string
    sql: ${TABLE}._question__likelihood_to_demonstrate ;;
  }

  dimension: _question__next_generation_opportunities {
    type: string
    sql: ${TABLE}._question__next_generation_opportunities ;;
  }

  dimension: _question__obedience_or_selfreliance {
    type: string
    sql: ${TABLE}._question__obedience_or_selfreliance ;;
  }

  dimension: _question__opinion_government {
    type: string
    sql: ${TABLE}._question__opinion_government ;;
  }

  dimension: _question__perceived_effect_of_diversity {
    type: string
    sql: ${TABLE}._question__perceived_effect_of_diversity ;;
  }

  dimension: _question__political_view {
    type: string
    sql: ${TABLE}._question__political_view ;;
  }

  dimension: _question__preferred_type_of_political_leader {
    type: string
    sql: ${TABLE}._question__preferred_type_of_political_leader ;;
  }

  dimension: _question__ranking_importance_of_issues_when_voting {
    type: string
    sql: ${TABLE}._question__ranking_importance_of_issues_when_voting ;;
  }

  dimension: _question__trust_in_own_judgment {
    type: string
    sql: ${TABLE}._question__trust_in_own_judgment ;;
  }

  dimension: _question__vote_for_in_us_election {
    type: string
    sql: ${TABLE}._question__vote_for_in_us_election ;;
  }

  dimension: _question__vote_next_national_election {
    type: string
    sql: ${TABLE}._question__vote_next_national_election ;;
  }

  dimension: _question__worldview {
    type: string
    sql: ${TABLE}._question__worldview ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
