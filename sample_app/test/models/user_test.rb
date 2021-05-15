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
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be valid"
    end
  end
  
end
