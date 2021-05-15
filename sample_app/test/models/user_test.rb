require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"Example User", email: "user@example.com")
  end
  
  test "should bd valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name= "a" * 51
    assert_not @user.valid?
  end
  
  test "email should be presend" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
end
