require 'spec_helper'

describe User do
	before(:each) do
    @attr = { :name => "Example User", 
      :email => "user@example.com", 
      :surname1 => "example1", 
      :surname2 => "example2" , 
      :nick => "Enric", 
      :password => "12345678",
      :password_confirmation => "12354678" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  #Name validations
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should rejects names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  #surname1 validations
  it "should require a surname1" do
    no_surname1_user = User.new(@attr.merge(:surname1 => ""))
    no_surname1_user.should_not be_valid
  end
  
  it "should rejects surname1 that are too long" do
    long_surname1 = "a" * 76
    long_surname1_user = User.new(@attr.merge(:surname1 => long_surname1))
    long_surname1_user.should_not be_valid
  end
  
  #surname2 validations
  it "should require a surname1" do
    no_surname2_user = User.new(@attr.merge(:surname2 => ""))
    no_surname2_user.should_not be_valid
  end
  
  it "should rejects surname2 that are too long" do
    long_surname2 = "a" * 76
    long_surname2_user = User.new(@attr.merge(:surname2 => long_surname2))
    long_surname2_user.should_not be_valid
  end
  
  #email validations
  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accepts valid emails adresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
    
  #nick validations
  it "should require a nick" do
    no_nick_user = User.new(@attr.merge(:email => ""))
    no_nick_user.should_not be_valid
  end
  
  it "should reject duplicate nick" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_nick = User.new(@attr)
    user_with_duplicate_nick.should_not be_valid
  end
  
  #Password validations
  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
    
end
