class Admin::DashboardController < ApplicationController
  before_action :require_superadmin
    def index
      @user_count = User.count
      @survey_count = Survey.count
      @category_count = Category.count
    end

    private

    def require_superadmin
      unless current_user&.role == "superadmin"
        redirect_to root_path, alert: "Access denied"
      end
    end
end
