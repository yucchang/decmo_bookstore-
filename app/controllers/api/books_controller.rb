class Api::BooksController < ApplicationController
  before_action :login_check!
  
  def favorite 
    book = Book.find(params[:id])

    fav = MyFavorite.find_by(user: current_user, book: book) 
    # 不能使用find，找不到會出現error message(如果在favorite model找不到資料需新增此筆資料)
    favorited = false 

     if fav 
      fav.destroy
      favorited = false
     else 
      current_user.my_favorites.create(book: book)
      favorited = true
     end

    render json: {status: 'OK', favorited: favorited}
  end 

  private 

  def login_check!
    if not user_signed_in?
      head 401
    end
  end 
end
