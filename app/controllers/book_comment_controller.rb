class BookCommentController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = @book.id
    comment.save
    @post_comment = PostComment.new
  end

  def destroy
    @book = Book.find(params[:book_id])
    # byebug
    PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @post_comment = PostComment.new
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
