class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :surname1
      t.string :surname2
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :password
      t.string :salt
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
