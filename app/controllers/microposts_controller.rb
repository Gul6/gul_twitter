class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy  # NEW LINE
  
  def create
    secure_post = params.require(:micropost).permit(:content)
    @micropost = current_user.microposts.build(secure_post)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []     # NEW LINE
      render 'static_pages/home'
    end
  end

  def destroy
  end
end