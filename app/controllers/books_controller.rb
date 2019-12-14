class BooksController < ApplicationController

  before_action :find_book, only: [:show, :comment]
  layout 'book'

  def index
    @books = Book.available
                 .with_attached_cover_image
                 .page(params[:page]) 
                 .per(4)
    @publishers = Publisher.available
    @categories = Category.all
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.order(id: :desc)
  end 

  def comment
    #comment 
    # @comment = Comment.new(comment_params, user: current_user, book: @book)

    #user 
    # @comment = current_user.comments.build(comment_params, book: @book)

    #book
    @comment = @book.comments.build(comment_params)

    if @comment.save 
      respond_to do |format|
        format.html
        format.js
      end
      # render js: 'alert("hi");'
      # redirect_to @book, notice: 'Comment created.'
    else 
      render js:'alert("error occurs");'
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def comment_params
    params.require(:comment)
          .permit(:title, :content)
          .merge(user: current_user)
  end
end