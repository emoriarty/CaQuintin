# == Schema Information
# Schema version: 20110409092942
#
# Table name: people
#
#  id         :integer         not null, primary key
#  user_id    :string(255)
#  name       :string(255)
#  surname1   :string(255)
#  surname2   :string(255)
#  email      :string(255)
#  phone      :string(255)
#  mobile     :string(255)
#  nick       :string(255)
#  password   :string(255)
#  salt       :string(255)
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < Person
  attr_accessor :password
  attr_accessible :name, :surname1, :surname2, :email, :password, :password_confirmation
  
  
  validates :password,
    :presence => true,
    :confirmation => true,
    :length       => { :within => 6..40 }
  validates :nick, 
    :presence => true,
    :length => { :minimum => 1, :maximum => 25 },
    :uniqueness => { :case_sensitive => false }
end
