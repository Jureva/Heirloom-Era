class FeedbacksController < ApplicationController
before_action :logged_in_customer, only: [:create, :destroy]

  def create
  end

  def destroy
  end
end
