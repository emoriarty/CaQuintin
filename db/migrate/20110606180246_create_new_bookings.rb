class CreateNewBookings < ActiveRecord::Migration
  def self.up
    change_table :bookings do |t|
      t.string :name, :limit => 50
      t.string :surname1, :limit => 100
      t.string :surname2, :limit => 100
      t.string :email, :limit => 200
      t.string :phone, :limit => 13
    end
  end

  def self.down
    change_table :bookings do |t|
      t.remove :name
      t.remove :surname1
      t.remove :surname2
      t.remove :email
      t.remove :phone
    end
  end
end
