require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "account_activation" do
    customer = customers(:karolina)
    customer.activation_token = Customer.new_token
    mail = CustomerMailer.account_activation
    assert_equal "Account activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match customer.name, mail.body.encoded
    assert_match customer.activation_token,   mail.body.encoded
    assert_match CGI.escape(customer.email),  mail.body.encoded
  end

  test "password_reset" do
    mail = CustomerMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
