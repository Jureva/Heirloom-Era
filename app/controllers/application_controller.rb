#code in this file follows the example in the book https://www.railstutorial.org/book/basic_login
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private

    # Confirms a logged-in customer.
    def logged_in_customer
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    
  
end
