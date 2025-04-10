module KpiHelper
    def classify_score(score)
      return "No Data" if score.nil?
  
      case score
      when 0..1.49 then "Poor"
      when 1.5..2.99 then "Average"
      when 3..3.99 then "Good"
      else "Very Proficient"
      end
    end
  end
  