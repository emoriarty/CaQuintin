# == Schema Information
# Schema version: 20110529143324
#
# Table name: bookings
#
#  id            :integer         not null, primary key
#  people_number :integer
#  date          :date
#  created_at    :datetime
#  updated_at    :datetime
#  client_id     :integer
#  time          :time
#

class Booking < ActiveRecord::Base
  attr_accessible :people_number, :date, :time, :client
  belongs_to :client, :validate => true
  
  validates :people_number,
    :presence => true,
    :inclusion => { :in => 2..10 }
  validates :date, :time,
    :presence => true
 
end
