class Admin::BookingsController < ApplicationController
  layout "admin/bookings"
  
  respond_to :html
  
  #after_filter :response, :except => [:index]
  
  def index
    logger.debug "Dentro de index"
    redirect_to today_admin_bookings_path
  end
  
  def today
    logger.debug "Dentro de today"
    @bookings = Booking.today.page(params[:page]).per(10)
    respond_with @bookings do |format|
      format.html{render "bookings"}
    end
  end
  
  def tomorrow
    @bookings = Booking.tomorrow.page(params[:page]).per(10)
    respond_with @bookings do |format|
      format.html{render "bookings"}
    end
  end
  
  def pendings
    @bookings = Booking.pending.page(params[:page]).per(10)
    respond_with @bookings do |format|
      format.html{render "bookings"}
    end
  end
  
  def old
    @bookings = Booking.old.page(params[:page]).per(10)
    respond_with @bookings do |format|
      format.html{render "bookings"}
    end
  end
  
  def all
    @bookings = Booking.all.page(params[:page]).per(10)
    respond_with @bookings do |format|
      format.html{render "bookings"}
    end
  end
  
  def destroy
    
  end
end
