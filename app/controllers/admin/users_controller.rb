class Admin::UsersController < ApplicationController
  before_action :require_superadmin
  def upload_form
  end

  def upload_csv
    if params[:file].present?
      result = UserCsvUpload.call(params[:file])
  
      if result[:created] > 0
        redirect_to admin_dashboard_index_path,
          notice: "#{result[:created]} users created, #{result[:skipped]} skipped."
      else
        redirect_to admin_users_upload_form_path,
          alert: "No users were added. All rows were skipped (e.g., users already exist)."
      end
    else
      redirect_to admin_users_upload_form_path, alert: "Please select a CSV file to upload."
    end
  end
  
  private

  def require_superadmin
    unless current_user&.role == "superadmin"
      redirect_to root_path, alert: "Access denied"
    end
  end
end
