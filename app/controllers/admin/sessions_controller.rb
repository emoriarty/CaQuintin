class Admin::SessionsController < ApplicationController
  layout "login"
  def new
  end
  
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])

    if user.nil?
      flash.now[:error] = I18n.t("admin.sessions.create.errors.invalid_user_password").capitalize
      render 'new'
    else
      sign_in user
      redirect_to admin_dashboard_index_path
    end
  end
  
  def destroy
    log_out
    redirect_to admin_path
  end

end
