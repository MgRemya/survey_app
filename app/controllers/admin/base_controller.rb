module Admin
    class BaseController < ApplicationController
      before_action :require_superadmin
  
      private
  
      def require_superadmin
        unless current_user&.role == "superadmin"
          redirect_to root_path, alert: "Access denied. Superadmin only."
        end
      end
    end
  end
  