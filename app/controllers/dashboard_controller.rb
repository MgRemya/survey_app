class DashboardController < ApplicationController
  before_action :check_for_login
    def index
      @current_user = current_user
      @available_surveys = Survey.all
      @attempted_survey_ids = current_user.user_surveys.pluck(:survey_id)
    end

end
