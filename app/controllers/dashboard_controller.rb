class DashboardController < ApplicationController
  before_action :check_for_login
    def index
      @current_user = current_user
    end
end
