class CustomerCareController < ApplicationController
    def index
        @customer_cares = CustomerCare.all
    end
    
    def show
        @customer_care = CustomerCare.find(params[:id])
    end
    
    
    def new
        @customer_care = CustomerCare.new 
    end

    def create
        @customer_care = CustomerCare.new(customer_care_params)
        if @customer_care.save
            redirect_to root_url
        end
    end
    
    def destroy
        @customer_care = CustomerCare.find(params[:id])
        @customer_care.delete
        redirect_to controller: 'customer_care', action: 'index'
    end
end



private
  def customer_care_params
    params.require(:mail)
    params.permit(:name, :mail, :subject, :message)
  end