class BookingController < ApplicationController
  def index
    @booking = Booking.new
    if params[:booking]
      @booking.attributes = params[:booking] 
    else
      @booking.build_client
    end
  end
  
  def create
    begin
      hash_booking = params[:booking]
      @booking = Booking.new
      @booking.build_client hash_booking[:client]
      hash_booking.delete :client
      @booking.attributes = hash_booking
      #@booking.date = DateTime.parse hash_booking[:date] 
      @booking.save!
    rescue ArgumentError => ae
      logger.error(ae)
      flash[:error] = I18n.t "datetime.errors.invalid"
      render :index
    rescue ActiveRecord::ActiveRecordError => e
      logger.error(e)
      logger.error(@booking)
      logger.error(@booking.errors)
      logger.error(@booking.client.errors)
      render :index
    else
      flash[:success] = I18n.t "booking.messages.succes"
      logger.debug "booking.date: #{@booking.date}"
      logger.debug "booking.client.id: #{@booking.client.id}"
      redirect_to booking_index_path
    end
  end
end
