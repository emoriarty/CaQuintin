class Admin::UsersController < ApplicationController
  layout "admin"
  
  def index
    
    if sign_in?
      @bookings = Booking.order(:date, :time).page(params[:page]).per(10)
    else
      redirect_to :admin_login
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
  end
end
