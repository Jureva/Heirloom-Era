class CustomersController < ApplicationController
# before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_customer, only: [:index,:edit, :update, :destroy]
  before_action :correct_customer, only: [:edit, :update]
  before_action :admin_customer,     only: :destroy
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.where(activated: true).paginate(page: params[:page])    #@customers = Customer.all 
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
     @customer = Customer.find(params[:id])
     redirect_to root_url and return unless true  
    #debugger
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    #respond_to do |format|
      if @customer.save
        @customer.send_activation_email
        #CustomerMailer.account_activation(@customer).deliver_now
        flash[:info] = "Please check Your email to activate Heirloom Era account."
        redirect_to root_url
        #log_in @customer
        #format.html { redirect_to @customer, notice: 'Customer Profile was successfully created.' }
        #format.json { render :show, status: :created, location: @customer }
      else
        render 'new'
        #format.html { render :new }
        #format.json { render json: @customer.errors, status: :unprocessable_entity }
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
  
   # @customer.delete
    #respond_to do |format|
     # format.html { redirect_to customers_url, notice: 'Customer Profile was successfully deleted.' }
      #format.json { head :no_content }
    #end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :password)
    end
    
    # Confirms a logged-in customer.
    def logged_in_customer
      unless logged_in?
      store_location 
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
    
    # Confirms the correct customer.
    def correct_customer
      @customer = Customer.find(params[:id])
      redirect_to(root_url) unless current_customer?(@customer)
    end
    
    # Confirms an admin customer.
    def admin_customer
      redirect_to(root_url) unless current_customer.admin?
    end
end
