require 'slack-ruby-client'
require 'slack'
require 'keys'

include Slack_Keys

Slack.configure do |config|
  config.token = SLACK_TOKEN
end

Slack.auth_test
