class Admin::SessionsController < ApplicationController
  
  def new
    render :layout => false
  end
  
  def create
    user = User.find_by_email(params[:session][:email], params[:session][:password])
    
    if user.nil?
      flash.now[:error] = I18n.t("admin.sessions.create.errors.invalid_user_password").capitalize
      render 'new', :layout => false
    else
      
    end
    
    
  end
  
  def destroy
  end

end
