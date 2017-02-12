require_relative 'keys'

require 'twitter'
require 'sentimental'

analyser = Sentimental.new
analyser.load_defaults
analyser.threshold = 0.1

include Twitter_Keys

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = TWITTER_CONSUMER_KEY
  config.consumer_secret     = TWITTER_CONSUMER_SECRET
  config.access_token        = TWITTER_ACCESS_TOKEN
  config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
end

puts "twitter id pls: "

id = gets.chomp

tweets = client.user_timeline(id, count: 30000)

if tweets.empty?
  puts "youre stupid"
  return
end

sentiments = Hash.new
sentiments.default = "youre stupid"

tweets.each do |tweet|
  sentimenty = analyser.score tweet.full_text
  sentiments.store(tweet.full_text, sentimenty)
end

def smallest_hash_key(hash)
  hash.min_by{|k,v| v}
end

puts smallest_hash_key(sentiments)
