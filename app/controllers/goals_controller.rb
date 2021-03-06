class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = current_user.goals
    @streaks = current_user.streaks
  end

  def reset
    @goal = Goal.find(params[:goal_id])
    respond_to do |format|
      if @goal.reset
        # format.html { redirect_to goals_path, notice: 'Goal was successfully created.' }
        format.js { render action: 'reset', status: :created, location: @goal }
      else
        # format.html { render action: 'new' }
        format.js { render :noting, status: :bad, location: @goal }
        # format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = current_user.goals.build(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @goal }
        format.js { render action: 'create', status: :created, location: @goal }
        @goal.create_activity :create, owner: current_user
      else
        format.html { render action: 'new' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.js { render action: 'update', status: :ok, location: @goal }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
      format.js { render action: 'destroy' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:title, :private, :user_id)
    end
end
