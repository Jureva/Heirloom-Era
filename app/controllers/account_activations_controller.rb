class AccountActivationsController < ApplicationController
    def edit
    customer = Customer.find_by(email: params[:email])
    #customer.activate
    #if customer && !customer.activated? && customer.authenticated?(:activation, params[:id])
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
