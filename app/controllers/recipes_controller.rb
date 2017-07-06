class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :like]
  before_action :require_logged_in_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end
  
  def show
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    if @recipe.save
      flash[:success] = "Recipe has been created successfully"
      redirect_to recipes_path
    else
      flash[:danger] = "Please correct the following errors."
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe has been successfully updated"
      redirect_to recipe_path(@recipe)
    else
      flash[:danger] = "Please correct the following errors."
      render 'edit'
    end
  end
  
  def destroy
    @recipe.destroy
    flash[:danger] = "Recipe has been successfully deleted."
    
    redirect_to recipes_path
  end
  
  def like
    Like.create(like: params[:like], chef: current_user, recipe: @recipe)
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :picture)
  end
  
  def require_same_user
    if current_user != @recipe.chef
      flash[:danger] = "You can only edit your own recipes"
      redirect_to recipes_path
    end
  end
  
  def require_logged_in_user
    if !logged_in?
      flash[:danger] = "Please sign up or log in"
      redirect_to login_path
    end
  end
  
end