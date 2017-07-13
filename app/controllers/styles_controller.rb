class StylesController < ApplicationController
  before_action :require_logged_in_user, only: [:new, :create]
  before_action :require_admin, only: [:new, :create]
  
  def show
    @style = Style.find(params[:id])
    @recipes = @style.recipes.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @style = Style.new
  end
  
  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:success] = "Style created successfully"
      redirect_to recipes_path
    else
      flash[:danger] = "Please try again"
      render 'new'
    end
      
    
  end
  
  private
  
  def style_params
    params.require(:style).permit(:name)
  end
  
  def require_logged_in_user
    if !logged_in?
      flash[:danger] = "Please log in or sign up"
      redirect_to login_path
    end
  end
  
  def require_admin
    if !current_user.admin?
      flash[:danger] = "Admin privileges required"
      redirect_to root_path
    end
  end
  
end