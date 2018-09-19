class StaticpagesController < ApplicationController
  def about
  end
  
  def faq
  end

  def dashboard
  	if user_signed_in?
	  	@enrolls = Enroll.all.where(user: current_user)
	  	@posts = Post.all
      @myposts = Post.all.where(user: current_user)
      @comments = Comment.all
      @mycomments = Comment.all.where(user: current_user)
    else
      @search = Post.ransack(params[:q])
      @posts = @search.result.includes(:comments)
	  end
  end

  def allbiz
    @businesses = Business.all
  end
end
