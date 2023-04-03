class UserExitsService < BaseUserEntranceService
  def initialize(user:)
    @user = user

    super()
  end

  def execute!
    EntranceLog.exit!(user: @user)
    send_slack_notification(blocks: message_blocks)
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
          text: "#{display_name} が退室しました。"
        }
      }
    ]
  end
end
