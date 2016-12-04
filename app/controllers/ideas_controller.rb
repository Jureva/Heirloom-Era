class IdeasController < ApplicationController
before_action :logged_in_customer, only: [:index,:show]  

  def index
    @customer = Customer.find(session[:customer_id])
    if @customer.admin or @customer.customer_care 
      @ideas = Idea.all
    else
      @ideas = Idea.by_id_and_customer_id(params[:id], session[:customer_id])
    end
  end
 
  def show
    @idea = Idea.find(params[:id])
  end
 
  def new
    @idea = Idea.new 
  end
   
  def edit
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.customer_id = session[:customer_id]
    
    if @idea.save
      redirect_to @idea
    else
      render 'new'
    end
  end
  
  def update
    @idea = Idea.find(params[:id])
   
    if @idea.update(idea_params)
      redirect_to @idea
    else
      render 'edit'
    end
  end
  
  def destroy
    @idea = Idea.find(params[:id])
    @idea.delete
   
    redirect_to ideas_path
  end
      
       # render plain: params[:idea].inspect
  private
  def idea_params
    params.require(:idea).permit(:title, :description)
  end
 
end

