class IngredientsController < ApplicationController
  before_action :require_logged_in_user, only: [:new, :create]
  
  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient has been saved successfully"
      redirect_to recipes_path
    else
      flash[:danger] = "Please try again"
      render 'new'
    end
  end
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
  
  def require_logged_in_user
    if !logged_in?
      flash[:danger] = "Please sign up or log in"
      redirect_to login_path
    end
  end
  
end