class WelcomeController < ApplicationController
  def index
    @feedback = current_customer.feedbacks.build if logged_in?
  end
end
