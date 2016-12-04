#code in this file follows the example in the book https://www.railstutorial.org/book/advanced_login
class SessionsController < ApplicationController
  def new
  end
  
  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      # Log the customer in and redirect to the customer's show page.
      if customer.activated?
      log_in customer
      params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
      redirect_back_or customer
      else
        message  = "Account not activated. "
        message += "Check Your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
      log_out if logged_in?
      redirect_to root_url
  end
end
