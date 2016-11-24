class OrdersController < ApplicationController
#before_action :logged_in_customer, only: [:index,:edit, :update, :destroy]
before_action :correct_customer, only: [:index, :destroy]
    def index
    @orders = Order.all
    end
    
    def show
    @order = Order.find(params[:id])
    end
    
    def new
      @order = Order.new    
    end

    #def edit
     # @order = Order.find(params[:id])
    #end
  
  protect_from_forgery except: [:hook]
  
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find params[:invoice]
      @order.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end
#end

    def create
      @order = Order.new(order_params) 
     
      if @order.save
        redirect_to @order
      else 
        render new
      end
    end
    
    def purchase
      if params[:id] == "special"
        my_params = { title: params[:title], description: params[:description], price: 0}
        @order = Order.new(my_params)
        @order.save
        redirect_to @order
      else
        @order = Order.find(params[:id])
        redirect_to @order.paypal_url(order_path(@order))
      end
    end
    
    #def update
     # @order = Order.find(params[:id])
     
    #if @order.update(order_params)
      #redirect_to @order
   # else
    #  render 'edit'
    #end
    #end
    
    def destroy
    @order = Order.find(params[:id])
    @order.delete
   
    redirect_to orders_path
    end
    

  private
    def order_params
      #params.require(:order).permit(:title, :price)
    end
    
    def correct_customer
      #@order = current_customer.orders.find_by(id: params[:id])
      @order = params[:id]
      #redirect_to root_url if @order.nil?
    end
    
end