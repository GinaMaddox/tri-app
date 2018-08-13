class Api::WorkoutsController < ApplicationController
  def index
    workouts = Workout.all
    render json: workouts.as_json
  end

  def create
    workout = Workout.new(
      swim_hours: params[:swim_hours],
      swim: params[:swim],
      bike_hours: params[:bike_hours],
      bike: params[:bike],
      run_hours: params[:run_hours],
      run: params[:run],
      total_hours: params[:total_hours]
      )
    workout.save
    render json: workout.as_json
  end

  def show
    wokrout = Workout.find_by(id: params[:id])
    render json: workout.has_json
  end

  def update
    workout = Workout.find_by(id: params[:id])
    workout.swim_hours =  params[:swim_hours] || workout.swim_hours
    workout.swim = params[:swim] || workout.swim
    workout.bike_hours = params[:bike_hours]  || workout.bike_hours
    workout.bike = params[:bike] || workout.bike
    workout.run_hours = params[:run_hours] || workout.run_hours
    workout.run = params[:run] || workout.run 
    workout.total_hours = params[:total_hours] || workout.total_hours
    workout.save
    render json: workout.as_json
  end

  def destroy
    workout = Workout.find_by(id: params[:id])
    workout.destroy
    render json: {message: "Workout successfully deleted"}
  end 
end
