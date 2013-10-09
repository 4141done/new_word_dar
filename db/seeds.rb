# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a = Word.create(word: "boobzar", context: "There were so many bitches at that party that it was a veritable boobzar.")
DailyCount.create(word: a, day: Time.now.midnight, count: 4)
DailyCount.create(word: a, day: Time.now.midnight-1.day, count:6)
DailyCount.create(word: a, day: Time.now.midnight-1.week, count: 3)

b = Word.create(word: "zittack", context: "We then popped our pimples in their direction as part of our zittack.")
DailyCount.create(word: b, day: Time.now.midnight, count: 2)
DailyCount.create(word: b, day: Time.now.midnight-1.day, count:9)
DailyCount.create(word: b, day: Time.now.midnight-1.week, count: 43)