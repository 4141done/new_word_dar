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
DailyCount.create(word: a, day: Time.now.midnight-2.day, count:9)
DailyCount.create(word: a, day: Time.now.midnight-1.week-1.second, count: 3)

b = Word.create(word: "zittack", context: "We then popped our pimples in their direction as part of our zittack.")
DailyCount.create(word: b, day: Time.now.midnight, count: 2)
DailyCount.create(word: b, day: Time.now.midnight-1.day, count:9)
DailyCount.create(word: b, day: Time.now.midnight-2.days, count:4)
DailyCount.create(word: b, day: Time.now.midnight-1.week-1.second, count: 43)

b = Word.create(word: "generage", context: "Don't fire on them when their shields are glowing blue--that means they're in absorb mode and your shots will allow them to generage.")
DailyCount.create(word: b, day: Time.now.midnight, count: 15)
DailyCount.create(word: b, day: Time.now.midnight-1.day, count:91)
DailyCount.create(word: b, day: Time.now.midnight-2.days, count:42)
DailyCount.create(word: b, day: Time.now.midnight-1.week-1.second, count:79)

CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'worldnews' } )
CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'AskReddit' } )
CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'WTF' } )
CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'AdviceAnimals' } )
CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'OkCupid' } )
CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'funny' } )
CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'gaming' } )
CrawlQueue.create(crawler: 'RedditCrawler', crawl_params: { subreddit: 'IAmA' } )
