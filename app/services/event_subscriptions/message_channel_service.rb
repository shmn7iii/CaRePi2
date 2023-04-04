module EventSubscriptions
  class MessageChannelService < BaseEventSubscriptionService
    USER_NOT_REGISTERD_ERROR_MESSAGE = 'カードリーダーに学生証をかざしユーザー登録を完了してください'

    def initialize(event_post_body:)
      @event_post_body = event_post_body
      @slack_user_id = event_post_body['event']['user']
      @slack_channel_id = event_post_body['event']['channel']
      @text = event_post_body['event']['text']

      super()
    end

    def execute!
      user = User.find_by(slack_user_id: @slack_user_id)
      if user.nil?
        slack_client.chat_postEphemeral(user: @slack_user_id,
                                        channel: @slack_channel_id,
                                        text: USER_NOT_REGISTERD_ERROR_MESSAGE)
        return
      end

      case @text
      when '入室'
        UserEntersService.execute!(user:)
      when '退室'
        UserExitsService.execute!(user:)
      end
    end
  end
end
