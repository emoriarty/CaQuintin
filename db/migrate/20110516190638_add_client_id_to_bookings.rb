class AddClientIdToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :client_id, :integer
  end

  def self.down
    remove_column :bookings, :client_id
  end
end
