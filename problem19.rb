#Problem 19
#
#You are given the following information, but you may prefer 
#to do some research for yourself.
#
#1 Jan 1900 was a Monday.
#Thirty days has September,
#April, June and November.
#All the rest have thirty-one,
#Saving February alone,
#Which has twenty-eight, rain or shine.
#And on leap years, twenty-nine.
#A leap year occurs on any year evenly divisible by 4, 
#but not on a century unless it is divisible by 400.
#
#How many Sundays fell on the first of the month during 
#the twentieth century (1 Jan 1901 to 31 Dec 2000)?

require 'lib/date'

first_day = ExtendedDate.new(1, 1, 1901)
last_day = ExtendedDate.new(31, 12, 2000)

count = 0
current_day = first_day
until current_day == last_day do
  if (current_day.day_of_week == 7 && current_day.day == 1) then 
    count += 1
  end
  current_day = current_day.tomorrow
end

print count
