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

  test "should not save without email" do 
    a = User.new 
    assert_not a.save 
    assert_equal ["can't be blank"], a.errors[:first_name]
  end 

end
