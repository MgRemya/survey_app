class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if user.role == "superadmin"
        redirect_to admin_dashboard_index_path, notice: "Welcome Superadmin!"; return;
      else
        redirect_to dashboard_path, notice: "Welcome #{user.name}!"; return;
      end
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out successfully"
  end
end
