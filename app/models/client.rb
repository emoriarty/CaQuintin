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


class Client < Person
  attr_accessible :name, :surname1, :surname2, :email, :phone, :mobile
  
  validates :phone,
    :length => { :minimum => 9, :maximum => 12 },
    :allow_blank => true
  
  validates :mobile,
    :presence => true,
    :length => { :minimum => 9, :maximum => 12 }
  
  validates :email, :presence => true,
    :format => { :with => EMAIL_REGEX }
    
  def save_with_no_validation
    self.save(false)
  end
end
