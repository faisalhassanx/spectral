class IngredientsController < ApplicationController
  
  def show
    
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
end