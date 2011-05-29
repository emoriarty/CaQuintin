class AddTimeToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :time, :time
  end

  def self.down
    remove_column  :bookings, :time
  end
end
