class DeleteUnnecessaryFields < ActiveRecord::Migration
  def self.up
    remove_column :people, :user_id
    remove_column :bookings, :time
    remove_column :bookings, :user_id
  end

  def self.down
    add_column :people, :user_id, :integer
    add_column :bookings, :time, :time
    add_column :bookings, :user_id, :integer
  end
end
