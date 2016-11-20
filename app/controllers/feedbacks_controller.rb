class FeedbacksController < ApplicationController
before_action :logged_in_customer, only: [:create, :destroy]
before_action :correct_customer,   only: :destroy
  def create
    @feedback = current_customer.feedbacks.build(feedback_params)
    if @feedback.save
      flash[:success] = "Feedback created!"
      redirect_to root_url
    else
      @feed_items = []
      render '/home'
    end
  end

  def destroy
    @feedback.destroy
    flash[:success] = "Feedback deleted"
    redirect_to request.referrer || root_url
  end
  
  private

    def feedback_params
      params.require(:feedback).permit(:content, :picture)
    end
    
    def correct_customer
      @feedback = current_customer.feedbacks.find_by(id: params[:id])
      redirect_to root_url if @feedback.nil?
    end
end
