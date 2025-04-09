class Admin::UsersController < ApplicationController
  before_action :require_superadmin
  def upload_form
  end

  def upload_csv
      puts "hereeeeee"
    if params[:file].present?
      result = UserCsvUpload.call(params[:file])
      redirect_to admin_dashboard_index_path, notice: "#{result[:created]} users created, #{result[:skipped]} skipped."
    else
      redirect_to admin_users_upload_path, alert: "Please select a CSV file."
    end
  end
  private

  def require_superadmin
    unless current_user&.role == "superadmin"
      redirect_to root_path, alert: "Access denied"
    end
  end
end
