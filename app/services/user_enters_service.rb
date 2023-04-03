class UserEntersService < BaseUserEntranceService
  def initialize(user:)
    @user = user

    super()
  end

  def execute!
    log = EntranceLog.enter!(user: @user)
    send_slack_notification(blocks: message_blocks)

    log
  end

  private

  def display_name
    return @user.id.to_s if @user.slack_user_id.nil?

    "#{@user.id} <@#{@user.slack_user_id}>"
  end

  def message_blocks
    [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: "#{display_name} が入室しました。"
        }
      }
    ]
  end
end
