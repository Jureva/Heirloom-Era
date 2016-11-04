class SessionsController < ApplicationController
  def new
  end
  
  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      # Log the customer in and redirect to the customer's show page.
      log_in customer
      redirect_to customer
    else
      # Create an error message.
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end
  def destroy
        log_out
    redirect_to root_url
  end
end
