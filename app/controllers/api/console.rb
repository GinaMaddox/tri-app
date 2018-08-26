

# irb(main):006:0> today = DateTime.now
# => Sun, 26 Aug 2018 10:59:55 -0400
# irb(main):007:0> race_date = Date.new(2018, 11, 3)
# => Sat, 03 Nov 2018
# irb(main):008:0> days_to_go = race_date - today
# => (738450501817/10800000000)
# irb(main):009:0> time_until = race_date - today
# => (738450501817/10800000000)
# irb(main):010:0> time_until.to_i
# => 68
# irb(main):011:0>

#____________________________________________
#Date.today
# irb(main):011:0> Date.today
# => Sun, 26 Aug 2018
# irb(main):012:0> 210.days.ago
# => Sun, 28 Jan 2018 15:15:07 UTC +00:00
# irb(main):013:0>


# require 'date'

# today = DateTime.now
# race_date = Date.new(2018, 11, 3)
# days_to_go = race_date - today
# time_until = race_date - today
# time_until.to_i             # get the number of days until race

# hours,minutes,seconds,frac = Date.day_fraction_to_time(time_until)
# [3053, 46, 57, Rational(1057, 180000000)]


#___RACE DATE, START DATE_____________________________________________
# irb(main):016:0> race_date = Date.new(2019, 4, 27)
# => Sat, 27 Apr 2019
# irb(main):017:0> days_to_go = race_date - today
# => (2628450501817/10800000000)
# irb(main):018:0> days_to_go.to_i
# => 243
# irb(main):019:0> weeks_to_go = days_to_go.to_i/7
# => 34
# irb(main):020:0> start_date = race_date - 210
# => Sat, 29 Sep 2018
# irb(main):021:0> start_date = race_date - 209
# => Sun, 30 Sep 2018
# irb(main):022:0>
