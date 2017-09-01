class StaticpagesController < ApplicationController
  def faq
  end

  def dashboard
  	@enrolls = Enroll.all.where(user: current_user)
  	@posts = Post.all.where()
  end
end
