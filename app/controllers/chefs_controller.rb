class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)  
  end
  
  def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
  end

  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "You have registered successfully."
      session[:chef_id] = @chef.id
      redirect_to recipes_path
    else
      flash[:danger] = "Please correct the following errors and try again"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @chef.update(chef_params)
      flash[:success] = "Account updated successfully"
      redirect_to chef_path(@chef)
    else
      flash[:danger] = "Please correct the following errors and try again"
      render 'edit'
    end
  end
  
  def destroy
    @chef.destroy
    flash[:danger] = "Account has been deleted"
  end
  
  private
  
  def set_chef
    @chef = Chef.find(params[:id])
  end
  
  def chef_params
    params.require(:chef).permit(:name, :email, :password)
  end
  
  def require_same_user
    if current_user != @chef
      flash[:danger] = "You can only edit your own profile"
      redirect_to chefs_path
    end
  end
  
  def require_logged_in_user
    if !logged_in?
      flash[:danger] = "Please log in or sign up"
      redirect_to login_path
    end
  end
  
  
end