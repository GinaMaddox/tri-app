json.array! workouts.each do |workout|
  json.id workout.id
  json.phase workout.phase
  json.week workout.week
  json.day workout.day
  json.swim workout.swim
  json.swim_hours workout.swim_hours
  json.bike workout.bike
  json.bike_hours workout.bike_hours
  json.run workout.run
  json.run_hours workout.run_hours
end