class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book_comment = BookComment.new

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless current_user.id == @book.user_id
      redirect_to books_path
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search
    range = params[:search_range]
    method = params[:search_method]
    word = params[:search_word]
    @books = Book.search(range,method,word)
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
