require 'koala'
require 'keys'

include Facebook_Keys

app_id = FACEBOOK_APP_ID
app_secret = FACEBOOK_APP_SECRET
callback_url = '2a00:23c4:6704:4e00:b0bc:c1b1:e928:b868'

@oauth = Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
Koala.config.api_version = "v2.4"

profile = @graph.get_object("me")
friends = @graph.get_connections("me", "friends")

# @graph.put_connections("me", "feed", message: "I am writing on my wall!")
#
# # Three-part queries are easy too!
# @graph.get_connections("me", "mutualfriends/#{friend_id}")
#
# # You can use the Timeline API:
# # (see https://developers.facebook.com/docs/beta/opengraph/tutorial/)
# @graph.put_connections("me", "namespace:action", object: object_url)
