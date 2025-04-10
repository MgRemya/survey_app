class Admin::DashboardController < ApplicationController
  before_action :require_superadmin
    def index
      @user_count = User.count
      @survey_count = Survey.count
      @category_count = Category.count
    end
    def user_kpis
      @user_surveys = UserSurvey.includes(:user, :survey, :user_survey_responses => :category)
    
      @kpi_data = @user_surveys.map do |us|
        {
          user: us.user,
          survey: us.survey,
          kpis: KpiCalculator.for_user_survey(us)
        }
      end
    end
    

    private

    def require_superadmin
      unless current_user&.role == "superadmin"
        redirect_to root_path, alert: "Access denied"
      end
    end
end
