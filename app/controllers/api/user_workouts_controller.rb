class Api::UserWorkoutsController < ApplicationController

  def index
	@user_workouts = current_user.user_workouts
	render json: user_workouts.as_json
  end


  def create
  end
end
