require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new(name: "Example Customer", email: "customer@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  # test "the truth" do
  #   assert true
  # end
  test "authenticated? should return false for a customer with nil digest" do
    assert_not @customer.authenticated?(:remember, '')
  end
end
