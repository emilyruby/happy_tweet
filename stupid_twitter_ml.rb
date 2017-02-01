require 'sentimentalizer'
require 'twitter'
require 'sentimental'
require 'keys'

include Twitter_Keys

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = TWITTER_CONSUMER_KEY
  config.consumer_secret     = TWITTER_CONSUMER_SECRET
  config.access_token        = TWITTER_ACCESS_TOKEN
  config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
end

class Analyzer
  def initialize
    Sentimentalizer.setup
  end

  def process(phrase)
    Sentimentalizer.analyze phrase
  end
end

analyser = Analyzer.new

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
  sentimenty = analyser.process(tweet.full_text)
  puts sentimenty.sentiment.to_s
  sentiments.store(tweet.full_text, sentimenty.sentiment)
end
