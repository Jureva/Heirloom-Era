require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def setup
    @customer = customers(:evelina)
    @other_customer = customers(:archer)
  end
  
  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { name: 'Grazina',email: 'faker@that.com', password:'obuolys', password_confirmation: 'obuolys' }
    end

    assert_redirected_to  root_url 
  end

  test "should show customer" do
    log_in_as (@customer)
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    log_in_as (@customer)
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    log_in_as (@customer)
    patch :update, id: @customer, customer: { name: @customer.name,  email: @customer.email}
    assert_redirected_to customer_path(assigns(:customer))
  end
  
  test "should redirect edit when logged in as wrong customer" do
    log_in_as(@other_customer)
    get :edit, id: @customer
    assert flash.empty?
    assert_redirected_to root_url

  end

  test "should redirect update when logged in as wrong customer" do
    log_in_as(@other_customer)
    patch :update, id: @customer, customer: { name: @customer.name, email: @customer.email }
    assert flash.empty?
    assert_redirected_to root_url
    
  end


  test "should destroy customer" do
    @customer = customers(:evelina)
    log_in_as(@customer)
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end
    assert_redirected_to customers_path
  end
end
