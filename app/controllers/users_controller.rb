class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    @goals = @user.goals.public_goals
    @streaks = @user.streaks
  end

  def edit
  end

  def update
  end
end
