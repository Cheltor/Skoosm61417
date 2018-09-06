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
	end
  end
end
