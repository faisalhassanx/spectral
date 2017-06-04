class ChefsController < ApplicationController
  
  def index
    
  end
  
  def show
    @chef = Chef.find(params[:id])
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
  end

  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "You have registered successfully."
      redirect_to recipes_path
    else
      flash[:danger] = "Please correct the following errors and try again"
      render 'new'
    end
  end
  
  def edit
    @chef = Chef.find(params[:id])
  end
  
  def update
    @chef = Chef.find(params[:id])
    if @chef.update(chef_params)
      flash[:success] = "Account updated successfully"
      redirect_to recipes_path
    else
      flash[:danger] = "Please correct the following errors and try again"
      render 'edit'
    end
  end
  
  def destroy
  
  end
  
  private
  
  def chef_params
    params.require(:chef).permit(:name, :email, :password)
  end
  
  
end