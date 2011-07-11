class RemoveClientInBookings < ActiveRecord::Migration
  def self.up
    remove_column :bookings, :client_id
  end

  def self.down
    add_column :bookings, :client_id, :integer
  end
end
