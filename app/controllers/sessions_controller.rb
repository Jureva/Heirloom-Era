class SessionsController < ApplicationController
  def new
  end
  
  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      # Log the customer in and redirect to the customer's show page.
      log_in customer
      params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
      redirect_back_or customer
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
