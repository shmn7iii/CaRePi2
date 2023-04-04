module Slack
  class OauthController < ApplicationController
    def invite; end

    # WIP
    def callback
      # Slack::Web::Client.new.oauth_v2_access(
      #   client_id: ENV['SLACK_CLIENT_ID'],
      #   client_secret: ENV['SLACK_CLIENT_SECRET'],
      #   code: params[:code],
      #   redirect_url: 'https://ENV['HOST_BASE_URL']/slack/oauth/success')
    end

    # WIP
    def success
      # @access_token = params[:access_token]
    end
  end
end
