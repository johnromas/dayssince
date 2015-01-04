class FollowingsController < ApplicationController
  # def create
  #   @following = current_user.followings.build(:follower_id => params[:follower_id])
  #   if @following.save
  #     flash[:notice] = "Added follower."
  #     redirect_to root_url
  #   else
  #     flash[:notice] = "Unable to add follower."
  #     redirect_to root_url
  #   end
  # end

  def follow
    @following = current_user.followings.build(:follower_id => params[:user_id])
    if @following.save
      flash[:notice] = "Added follower."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add follower."
      redirect_to root_url
    end
  end

  def followers
    @followers = current_user.inverse_followers
  end

  def following
    @followings = current_user.followers
  end

  def destroy
    @following = current_user.followings.find(params[:id])
    @following.destroy
    flash[:notice] = "Removed following."
    redirect_to root_path
  end
end
