class RegistrationsController < ApplicationController
# POST /registrations
  def create
    @registration = Registration.new()
    if @registration.save
      redirect_to @registration.paypal_url(registration_path(@registration))
    else
      render :new
    end
  end
  
  #protect_from_forgery except: [:hook]
  
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @registration = Registration.find params[:invoice]
      @registration.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end
end