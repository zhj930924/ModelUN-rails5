require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(real_name: "Ruoyu Su", committee_name: "future of international relations", email: "su20yu1919@gmail.com", graduation_class: "2016")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.real_name = "         "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "       "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.real_name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end
  
end
