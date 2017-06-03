class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1) 
    if @recipe.save
      flash[:success] = "Recipe has been created successfully"
      redirect_to recipes_path
    else
      flash[:danger] = "Please correct the following errors."
      render 'new'
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe has been successfully updated"
      redirect_to recipe_path(@recipe)
    else
      flash[:danger] = "Please correct the following errors."
      render 'edit'
    end
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:danger] = "Recipe has been successfully deleted."
    
    redirect_to recipes_path
  end
  
  def like
    @recipe = Recipe.find(params[:id])
    Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :picture)
  end
  
end