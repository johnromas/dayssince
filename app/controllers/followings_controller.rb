class FollowingsController < ApplicationController
  def create
    @following = current_user.followings.build(:follower_id => params[:follower_id])
    if @following.save
      flash[:notice] = "Added follower."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add follower."
      redirect_to root_url
    end
  end

  def destroy
    @following = current_user.followings.find(params[:id])
    @following.destroy
    flash[:notice] = "Removed following."
    redirect_to root_path
  end
end
