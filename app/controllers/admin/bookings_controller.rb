class Admin::BookingsController < ApplicationController
  layout "admin/bookings"
  
  respond_to :html
  
  def index
    redirect_to :today_admin_bookings_path
  end
  
  def today
    respond_with @bookings = Booking.today.page(params[:page]).per(10)
  end
  
  def tomorrow
    respond_with @bookings = Booking.tomorrow.page(params[:page]).per(10)
  end
  
  def pendings
    respond_with @bookings = Booking.pending.page(params[:page]).per(10)
  end
  
  def past
  end
  
  def all
  end
end
