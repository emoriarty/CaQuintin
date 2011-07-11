require 'spec_helper'

describe Booking do
  before(:each) do
    @attr = { :email => "user@example.com", 
      :name => "Julie", 
      :surname1 => "example1", 
      :surname2 => "example2" , 
      :people_number => 4, 
      :date => "17/7/2011",
      :time => "13:00" ,
      :phone => "987654321"}
  end
  
  it "should create a new instance given valid attributes" do
    Booking.create!(@attr)
  end
  
  #Name validations
  it "should require a name" do
    no_name_booking = Booking.new(@attr.merge(:name => ""))
    no_name_booking.should_not be_valid
  end
  
  it "should rejects names that are too long" do
    long_name = "a" * 51
    long_name_booking = Booking.new(@attr.merge(:name => long_name))
    long_name_booking.should_not be_valid
  end
  
  #surname1 validations
  it "should require a surname1" do
    no_surname1_booking = Booking.new(@attr.merge(:surname1 => ""))
    no_surname1_booking.should_not be_valid
  end
  
  it "should rejects surname1 that are too long" do
    long_surname1 = "a" * 76
    long_surname1_booking = Booking.new(@attr.merge(:surname1 => long_surname1))
    long_surname1_booking.should_not be_valid
  end
  
  #surname2 validations
  it "should not require a surname2" do
    no_surname1_booking = Booking.new(@attr.merge(:surname2 => ""))
    no_surname1_booking.should be_valid
  end
  
  #email validations
  it "should require an email" do
    booking = Booking.new(@attr.merge(:email => ""))
    booking.should_not be_valid
  end
  
  it "should accepts valid emails adresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      booking = Booking.new(@attr.merge(:email => address))
      booking.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      booking = Booking.new(@attr.merge(:email => address))
      booking.should_not be_valid
    end
  end
  
  it "should accept duplicate email addresses" do
    # Put a user with given email address into the database.
    Booking.create!(@attr)
    booking = Booking.new(@attr)
    booking.should be_valid
  end
  
  #phone validations
  describe "phone validations" do
    it "should require a phone" do
      no_phone_booking = Booking.new(@attr.merge(:phone => ""))
      no_phone_booking.should_not be_valid
    end
  
    it "should reject a phone number less than 9 characters" do
      short_phone = "98765"
      booking = Booking.new(@attr.merge(:phone => short_phone ))
      booking.should_not be_valid
    end
  
    it "should reject a phone number longer than 12 characters" do
      long_phone = "987654321098754"
      booking = Booking.new(@attr.merge(:phone => long_phone ))
      booking.should_not be_valid
    end
    
    it "should be numeric" do
      not_numeric_phones = %w[+98643hsad7 98643dfa7 re8643dfa7]
      not_numeric_phones.each do |phone|
        booking = Booking.new @attr.merge(:phone => phone)
        booking.should_not be_valid
      end
    end
  end
end