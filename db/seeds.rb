# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#   # inputs = hours and minutes ex: 1:00 or 0:30, datatype is integer; 
#   # BAD output = 1 or 0)
#   # GOOD output = hours and minutes into minutes (1:00 = 60; 0:30 = 30)
#   # Workout.create(row.to_hash)
  
#   # inputs...nil, time (1:00, 2:45, 0:30), "60"
#   # if input is nil, output is nill
#   # if input is "60", output is 60 (minutes)
#   # if input is time (1:30), output is 90 (minutes)
  
#    # if row["bike_hours"] == nil
#    #   bike_hours = nil
#    # elsif row["bike_hours"] == "60"
#    #   bike_hours = 60
#    # else
#    #    bike_hours = row["bike_hours"].split(":")
#    #    bike_hours = row["bike_hours"][0].to_i * 60 + row["bike_hours"][1].to_i
#    # end 
#    # p bike_hours

#    # if row["swim_hours"] == nil
#    #   swim_hours = nil
#    # elsif row["swim_hours"] == "60"
#    #   swim_hours = 60
#    # else
#    #    swim_hours = row["swim_hours"].split(":")
#    #    swim_hours = swim_hours[0].to_i * 60 + swim_hours[1].to_i
#    # end 
#    # p swim_hours

#    # if row["run_hours"] == nil
#    #   run_hours = nil
#    # elsif row["run_hours"] == "60"
#    #   run_hours = 60
#    # else
#    #    run_hours = row["run_hours"].split(":")
#    #    run_hours = run_hours[0].to_i * 60 + run_hours[1].to_i
#    # end 

#    # p run_hours

#    # if row["total_hours"] == nil
#    #   total_hours = nil
#    # elsif row["total_hours"] == "60"
#    #   total_hours = 60
#    # else
#    #    total_hours = row["total_hours"].split(":")
#    #    total_hours = total_hours[0].to_i * 60 + total_hours[1].to_i
#    # end 
require 'csv'

path = Rails.root.join('lib', 'seeds', "Tri - Workouts.csv")

CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|
  
  Workout.create(
    phase: row["phase"],
    plan_id: row["plan_id"],
    week: row["week"],
    day: row["day"],
    swim_hours: 
     if row["swim_hours"] == nil
       swim_hours = nil
     elsif row["swim_hours"] == "60"
       swim_hours = 60
     else
       swim_hours = row["swim_hours"].split(":")
       swim_hours = swim_hours[0].to_i * 60 + swim_hours[1].to_i
      end ,
    swim: row["swim"] ,
    bike_hours: 
      if row["bike_hours"] == nil
        bike_hours = nil
      elsif row["bike_hours"] == "60"
        bike_hours = 60
      else
        bike_hours = row["bike_hours"].split(":")
        bike_hours = row["bike_hours"][0].to_i * 60 + row["bike_hours"][1].to_i
      end ,
    bike: row["bike"],
    run_hours: 
      if row["run_hours"] == nil
        run_hours = nil
      elsif row["run_hours"] == "60"
        run_hours = 60
      else
        run_hours = row["run_hours"].split(":")
        run_hours = run_hours[0].to_i * 60 + run_hours[1].to_i
      end ,
    run: row["run"],
    total_hours: 
      if row["total_hours"] == nil
        total_hours = nil
      elsif row["total_hours"] == "60"
        total_hours = 60
      else
        total_hours = row["total_hours"].split(":")
        total_hours = total_hours[0].to_i * 60 + total_hours[1].to_i
      end
  )
  
end 

plans = Plan.create([{name: "full", weeks: 30}, {name: "half", weeks: 16}, {name: "olympic", weeks: 12}, {name: "sprint", weeks: 8}])


# path = Rails.root.join('lib', 'seeds', "Tri - Swim.csv")

# CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|
#   Swim.create(row.to_hash)
# end 

# Workout.all.each do |wk|
#   if wk.swim_hours != nil
#     sh = wk.swim_hours
#     wk.update(swim_hours: sh*60)
#   end
