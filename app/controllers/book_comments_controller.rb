class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)   # =comment = PostComment.new(post_comment_params)comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    if @book_comment.save
    #redirect_to book_path(book)(非同期通信のため)
    else
    render 'books/show'
    end
  end

  def destroy
   @book = Book.find(params[:book_id])
   BookComment.find_by(id: params[:id]).destroy
    #redirect_to book_path(params[:book_id])(非同期通信のため)

  end

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
