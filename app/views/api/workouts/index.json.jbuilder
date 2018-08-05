json.array! @workouts.each do |workout|
  json.id workout.id
  json.week workout.week
  json.day workout.day
  json.swim workout.swim
  json.swim_hours workout.swim_hours
end