# == Schema Information
# Schema version: 20110422190938
#
# Table name: bookings
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  people_number :integer
#  date          :date
#  time          :time
#  created_at    :datetime
#  updated_at    :datetime
#

class Booking < ActiveRecord::Base
end
