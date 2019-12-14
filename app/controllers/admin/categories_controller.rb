class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  layout 'backend'

  def index
    @categories = Category.all
  end

  def show
  end

  def new 
    @category = Category.new
  end 

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Category create!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category updated!'
    else 
      render :edit
    end
  end

  def destroy
    @category.destroy if @category
    redirect_to admin_categories_path, notice: 'Category was deleted~~~'
  end


  private 

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
