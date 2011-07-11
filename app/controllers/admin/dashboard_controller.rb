class Admin::DashboardController < ApplicationController
  layout "admin"
  
  respond_to :html
  
  def index
    redirect_to(sign_in? ? admin_bookings_path : admin_login_path)
  end
end
