class FlagsController < ApplicationController
  def flagged
    @posts = Post.joins(:flags).group('posts.id')
    @books = Book.joins(:flags).group('books.id')
  end
  
  def flags
    @flags = Flag.all
  end
  
  def destroy
    @flag = Flag.find(params[:id])
    @flag.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Flag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
