class ChefsController < ApplicationController
  
  def index
    
  end
  
  def show
    
  end

  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "You have registered successfully."
      redirect_to chef_path(@chef)
    else
      flash[:danger] = "Please correct the following errors and try again"
      render 'new'
    end
  end
  
  def edit
    @chef = Chef.find(params[:id])
    
  end
  
  def update
  
  end
  
  def destroy
  
  end
  
  private
  
  def chef_params
    params.require(:chef).permit(:name, :email, :password)
  end
  
  
end