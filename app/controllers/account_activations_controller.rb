#code in this file follows the example in the book https://www.railstutorial.org/book/account_activation
class AccountActivationsController < ApplicationController
    def edit
    customer = Customer.find_by(email: params[:email])
    
    if customer && customer.authenticated?(:activation, params[:id])
      customer.activate
      log_in customer
      flash[:success] = "Account activated!"
      redirect_to customer
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
    end
end
