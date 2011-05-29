class ChangeDateFieldToDateTimeField < ActiveRecord::Migration
  def self.up
    change_column :bookings, :date, :datetime
  end

  def self.down
    change_column :bookings, :date, :date
  end
end
