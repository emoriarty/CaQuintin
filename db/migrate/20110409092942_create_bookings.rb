class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :people_number
      t.date :date
      t.time :time

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
