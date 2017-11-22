require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should allow setting first name" do
    a = User.new
    a.first_name = "Bob"
    assert_equal "Bob", a.first_name
  end

  test "should allow setting first name and last name" do
    a = User.new
    a.first_name = "Bob"
    a.last_name = "Lalala"
    assert_equal "Bob", a.first_name
    assert_equal "Lalala", a.last_name
  end

  test "should allow setting password" do 
    a = User.new(first_name: "Adam")
    a.password = "asdf"
    assert_equal "asdf", a.password
  end

  test "should not save without password" do 
    a = User.create(first_name: "Quy", last_name: "Nguyen")
    assert_equal ["can't be blank"], a.errors[:password]
  end

  test "should allow setting password confirmation" do 
    a = User.new(first_name: "Quy", last_name: "Nguyen")
    a.password = "123"
    a.password_confirmation = "123"
    assert_equal "123", a.password_confirmation
  end 

  test "should save with a password but without confirmation" do 
    a = User.create(first_name: "Quy", last_name: "Nguyen", password: "123")
    assert a.save 
  end 

  test "should not save with incorrect password_confirmation" do 
    a = User.new(first_name: "Quy", last_name: "Nguyen")
    a.password = "123"
    a.password_confirmation = "000"
    a.save 
    assert_equal ["doesn't match Password"], a.errors[:password_confirmation]
  end 

  test "should save with correct password confirmation" do 
    a = User.new(first_name: "Quy", last_name: "Nguyen", password: "123")
    a.password_confirmation = "123"
    assert a.save 
  end 

  test "authenticate should return true if password matches" do 
    a = User.create!(first_name: "Quy", last_name: "Nguyen", password: "123")
    assert a.save 
    assert_not a.authenticate("must understand authenticate")
    assert a.authenticate("123")
  end 

  # test "should not save without email" do 
  #   a = User.new 
  #   assert_not a.save 
  #   assert_equal ["can't be blank"], a.errors[:first_name]
  # end 

end
