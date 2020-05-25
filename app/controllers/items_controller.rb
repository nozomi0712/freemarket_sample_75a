class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end
  
  def show
    @items = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  def purchase
  end
end
