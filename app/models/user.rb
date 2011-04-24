# == Schema Information
# Schema version: 20110424164921
#
# Table name: people
#
#  id                 :integer         not null, primary key
#  user_id            :string(255)
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

require 'digest'

class User < Person
  attr_accessor :password
  attr_accessible :name, :surname1, :surname2, :nick, :email, :password, :password_confirmation
  
  validates :password,
    :presence => true,
    :confirmation => true,
    :length       => { :within => 6..40 }
  validates :nick, 
    :presence => true,
    :length => { :maximum => 25 },
    :uniqueness => { :case_sensitive => false }
    
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  private
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end  
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
