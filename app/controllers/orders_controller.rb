class OrdersController < ApplicationController
#before_action :logged_in_customer, only: [:index,:edit, :update, :destroy]
#before_action :correct_customer, only: [:edit, :update, :destroy]

    def index
    @orders = Order.all
    end
    
    def show
    @order = Order.find(params[:id])
    end
    
    def new
      @order = Order.new    
    end

    def edit
      @order = Order.find(params[:id])
    end

    def create
      @order = Order.new(order_params) 
     
      if @order.save
        redirect_to @order
      else 
        render new
      end
    end
    
    def purchase
      @order = Order.find(params[:id])
      redirect_to @order.paypal_url(order_path(@order))
    end
    
    def update
      @order = Order.find(params[:id])
     
    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
    end
    
    def destroy
    @order = Order.find(params[:id])
    @order.delete
   
    redirect_to orders_path
    end
  
    private
    def order_params
      params.require(:order).permit(:title, :price)
    end
end