#code in this file follows the example in the book https://www.railstutorial.org/book/updating_and_deleting_users 
class CustomersController < ApplicationController
  before_action :logged_in_customer, only: [:index, :show]  
  before_action :correct_customer, only: [:edit, :update]

  before_action :admin,     only: :destroy

  def index
    @customers = Customer.where(activated: true).paginate(page: params[:page])    
  end

  def show
     @customer = Customer.find(params[:id])
     @feedbacks = @customer.feedbacks.paginate(page: params[:page])
     redirect_to root_url and return unless true  
    #debugger
  end

  
  def new
    @customer = Customer.new
  end

 
  def edit
    @customer = Customer.find(params[:id])
  end

  
  def create
    @customer = Customer.new(customer_params)

    
      if @customer.save
        @customer.send_activation_email
      
        flash[:info] = "Please check Your email to activate Heirloom Era account."
        redirect_to root_url
      
      else
        render 'new'
      end
  end


  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 
  # DELETE /customers/1.json
  def destroy
  Customer.find(params[:id]).destroy
  flash[:success] = "Customer deleted"
  redirect_to customers_url
  end  
  
  
 
  private
    def customer_params
      params.require(:customer).permit(:name, :email, :password, :password_confirmation)
    end
    
    
    
    # Confirms the correct customer.
    def correct_customer
      @customer = Customer.find(params[:id])
      redirect_to(root_url) unless current_customer?(@customer)
    end
    
    # Confirms an admin customer.
    def admin
      redirect_to(root_url) unless current_customer.admin?
    end
end
