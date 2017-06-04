class ChefsController < ApplicationController
  
  def index
    
  end
  
  def show
    
  end

  def new
    @chef = Chef.new
  end
  
  def create
  
  end
  
  def edit
    @chef = Chef.find(params[:id])
  end
  
  def update
  
  end
  
  def destroy
  
  end
  
  
end