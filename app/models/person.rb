# == Schema Information
# Schema version: 20110516190638
#
# Table name: people
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  surname1           :string(255)
#  surname2           :string(255)
#  email              :string(255)
#  phone              :string(255)
#  mobile             :string(255)
#  nick               :string(255)
#  password           :string(255)
#  salt               :string(255)
#  type               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

class Person < ActiveRecord::Base
  attr_accessible :name, :surname1, :surname2, :email, :phone, :mobile, :nick
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true,
    :length => { :maximum => 50 }
  
  validates :surname1, :presence => true,
    :length => { :maximum => 75 }          
  
  validates :surname2,
    :length => { :maximum => 75 },
    :allow_blank => true
  
  validates :email, :presence => true,
    :format => { :with => EMAIL_REGEX }
end
