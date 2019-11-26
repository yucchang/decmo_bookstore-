class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.available.with_attached_cover_image
  end

  def show
  end 
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params) 
  
    if @book.save
      redirect_to root_path, notice: 'Book created'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @book.update(book_params)
      redirect_to edit_book_path(@book), notice: 'Book Updated'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: 'Deleted!'
  end
  
  private

  def find_book
    @book = Book.find(params[:id])
  end
  
  # strong parameters
  def book_params
    params.require(:book).permit(:title, 
                                 :description, 
                                 :list_price,
                                 :sell_price,
                                 :page_num,
                                 :isbn,
                                 :isbn13,
                                 :cover_image,
                                 :on_sell,
                                 :published_at,
                                 :publisher_id,
                                 )
  end
end