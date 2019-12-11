class Admin::CategoriesController < ApplicationController

  layout 'backend'

  def index
    @categories = Category.all
  end

  def new 
  end 

  def create
  end

  def edit
  end

  def update
  end
end
