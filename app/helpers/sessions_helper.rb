module SessionsHelper

  # Logs in the given customer.
  def log_in(customer)
    session[:customer_id] = customer.id
  end
  
  # Remembers a customer in a persistent session.
  def remember(customer)
    customer.remember
    cookies.permanent.signed[:customer_id] = customer.id
    cookies.permanent[:remember_token] = customer.remember_token
  end
  
   # Returns the user corresponding to the remember token cookie.
  def current_customer
    if (customer_id = session[:customer_id])
      @current_customer ||= Customer.find_by(id: customer_id)
    elsif (customer_id = cookies.signed[:customer_id])
      # raise       The tests still pass, so this branch is currently untested.
      customer = Customer.find_by(id: customer_id)
    if customer && customer.authenticated?(cookies[:remember_token])
        log_in customer
        @current_customer = customer
    end
    end
  end
  
  # Returns the current logged-in customer (if any).
  #def current_customer
    #customer = Customer.find_by(id: customer_id)
  #end
  
  # Returns true if the customer is logged in, false otherwise.
  def logged_in?
    !current_customer.nil?
  end
  
  # Forgets a persistent session.
  def forget(customer)
    customer.forget
    cookies.delete(:customer_id)
    cookies.delete(:remember_token)
  end
  
  # Logs out the current customer.
  def log_out
    forget(current_customer)
    session.delete(:customer_id)
    @current_customer = nil
  end
end

