# == Schema Information
# Schema version: 20110606180246
#
# Table name: bookings
#
#  id            :integer         not null, primary key
#  people_number :integer
#  date          :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  client_id     :integer
#  time          :time
#  name          :string(50)
#  surname1      :string(100)
#  surname2      :string(100)
#  email         :string(200)
#  phone         :string(13)
#

class Booking < ActiveRecord::Base
  #attr_accessor :people_number, :time, :client, :name, :surname1, :surname2, :email, :phone
  attr_accessible :people_number, :date, :time, :client, :name, :surname1, :surname2, :email, :phone
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_REGEX = /^((?![A-za-z]).)*$/
  
  after_save :format_date_to_db
  
  validates :people_number,
    :presence => true,
    :inclusion => { :in => 2..10 }
  
  validates :date, :time,
    :presence => true
  
  validates :phone, :presence => true,
    :length => { :minimum => 9, :maximum => 12 },
    :format => { :with => PHONE_REGEX }

  validates :email, :presence => true,
    :format => { :with => EMAIL_REGEX }
  
  validates :name, :presence => true,
    :length => { :maximum => 50 }
    
  validates :surname1, :presence => true,
    :length => { :maximum => 75 }          
  
  validates :surname2,
    :length => { :maximum => 75 },
    :allow_blank => true
  
  
  def date
    @attributes['date'].blank? ? nil : @attributes['date'].to_date
  end
  
  def format_date_to_db
    @attributes['date'] = @attributes['date'].to_date.strftime("%Y/%m/%d")
  end
  
  def self.pending
    order(:date, :time).where("date >= ?", Date.today.strftime('%Y/%m/%d'))
  end
  
  def self.today
    order(:time).where(:date => Date.today)
  end
  
  def self.tomorrow
    order(:time).where(:date => Date.tomorrow)
  end
  
  def self.old
    order(:time).where("date < ?", Date.today)
  end
  
  def self.all
    order(:date)
  end
end
