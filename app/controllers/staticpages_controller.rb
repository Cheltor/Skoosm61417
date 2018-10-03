class StaticpagesController < ApplicationController
  def about
  end
  
  def faq
  end

  def dashboard
  	if user_signed_in?
	  	@enrolls = Enroll.all.where(user: current_user)
	  	@posts = Post.all
      @myposts = Post.all.where(user: current_user).paginate(page: params[:page], per_page: 7)
      @comments = Comment.all
      @mycomments = Comment.all.where(user: current_user).paginate(page: params[:page], per_page: 7)
      #@rewards = Reward.all
      #@myrewards = Reward.all.where(user: current_user)
    elsif business_signed_in?
      @rewards = Reward.all
      @myrewards = Reward.all.where(business: current_business).paginate(page: params[:page], per_page: 7)
    else
      @search = Post.ransack(params[:q])
      @posts = @search.result.includes(:comments)
	  end
  end

  def allbiz
    @businesses = Business.all
  end
end
