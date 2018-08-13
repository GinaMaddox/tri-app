# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

path = Rails.root.join('lib', 'seeds', "Tri - Workouts.csv")

CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|
  Workout.create(row.to_hash)
end 

# path = Rails.root.join('lib', 'seeds', "Tri - Swim.csv")

# CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|
#   Swim.create(row.to_hash)
# end 

Workout.all.each do |wk|
  if wk.swim_hours != nil
    sh = wk.swim_hours
    wk.update(swim_hours: sh*60)
  end
end