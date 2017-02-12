require_relative 'keys'
require 'twitter'

include Twitter_Keys

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = TWITTER_CONSUMER_KEY
  config.consumer_secret     = TWITTER_CONSUMER_SECRET
  config.access_token        = TWITTER_ACCESS_TOKEN
  config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
end

puts "what is your twitter id: "
id = gets.chomp

cursor = "-1"
follower_ids = []

while cursor != 0 do
 followers = client.follower_ids(id,{:cursor=>cursor})
 cursor = followers.to_h[:next_cursor_str].to_i
 (follower_ids << followers.to_h[:ids]).flatten!
 sleep(2)
end

puts follower_ids
