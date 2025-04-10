class KpiCalculator
    def self.for_user_survey(user_survey)
      responses = user_survey.user_survey_responses.includes(:category)
      return {} if responses.blank?
  
      total = responses.sum(&:score)
      avg_per_cat = responses.group_by(&:category).transform_values do |res|
        (res.sum(&:score).to_f / res.size).round(2)
      end
  
      engagement_index = ((total.to_f / (responses.size * 5)) * 100).round(1)
  
      high_perf_count = responses.count { |r| r.score >= 4 }
      high_perf_percent = ((high_perf_count.to_f / responses.size) * 100).round(1)
  
      {
        total_score: total,
        engagement_index: engagement_index,
        high_perf_percent: high_perf_percent,
        average_score_by_category: avg_per_cat
      }
    end
  end
  