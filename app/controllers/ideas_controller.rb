class IdeasController < ApplicationController
before_action :logged_in_customer, only: [:index,:show]  
#before_action :correct_customer, only: [:create, :show, :edit, :update, :destroy]
before_action :admin_customer, only: :destroy
  
  def index
    #@ideas = Idea.all
    @ideas = Idea.by_id_and_customer_id(params[:id], session[:customer_id])
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
  
   # Confirms the correct customer.
    #def correct_customer
      #@idea = params[:id]
      #redirect_to(root_url) unless current_customer?(@customer)
    #end
    
    
    # Confirms an admin customer.
    def admin_customer
      redirect_to(root_url) unless current_customer.admin?
    end
end

