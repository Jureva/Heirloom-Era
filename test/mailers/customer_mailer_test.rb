require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "account_activation" do
    @customer = customers(:archer)
    @customer.activation_token = Customer.new_token
    mail = CustomerMailer.account_activation(@customer)
    assert_equal "Account activation", mail.subject
    assert_equal ["duchess@example.gov"], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match @customer.name, mail.body.encoded
    assert_match @customer.activation_token,   mail.body.encoded
    assert_match CGI.escape(@customer.email),  mail.body.encoded
  end

  test "password_reset" do
    @customer = customers(:archer)
    @customer.reset_token = Customer.new_token
    mail = CustomerMailer.password_reset(@customer)
    assert_equal "Password reset", mail.subject
    assert_equal ["duchess@example.gov"], mail.to
    assert_equal ["noreply@example.com"], mail.from
  end
end
