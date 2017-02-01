require 'twilio-ruby'
require 'keys'

include Twilio_Keys

account_sid = SID # Your Account SID from www.twilio.com/console
auth_token = AUTH_TOKEN   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Hello from Ruby",
    :to => "+447876752604",    # Replace with your phone number
    :from => "+441633530237")  # Replace with your Twilio number
