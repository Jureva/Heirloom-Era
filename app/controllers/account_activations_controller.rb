class AccountActivationsController < ApplicationController
    def edit
    customer = Customer.find_by(email: params[:email], id: params[:id])
    if customer && !customer.activated? && customer.authenticated?(:activation, params[:id])
      customer.activate
      #customer.update_attribute(:activated,    true)
      #customer.update_attribute(:activated_at, Time.zone.now)
      log_in customer
      flash[:success] = "Account activated!"
      redirect_to customer
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
    end
end