module Slack
  class EventsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def callback
      body = JSON.parse(request.body.read)

      case body['type']
      when 'url_verification'
        render json: body
      when 'event_callback'
        EventSubscriptions::MessageChannelService.execute!(event_post_body: body)
        head :ok
      end
    end
  end
end
