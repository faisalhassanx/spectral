class StylesController < ApplicationController
  
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
  
end