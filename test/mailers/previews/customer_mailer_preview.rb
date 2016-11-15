# Preview all emails at http://heirloom4era-jureva.c9users.io/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  # Preview this email at http://heirloom4era-jureva.c9users.io/rails/mailers/customer_mailer/account_activation
  def account_activation
    customer = Customer.first
    customer.activation_token = Customer.new_token
    CustomerMailer.account_activation(customer)
  end

  # Preview this email at http://heirloom4era-jureva.c9users.io/rails/mailers/customer_mailer/password_reset
  def password_reset
    CustomerMailer.password_reset
  end

end
