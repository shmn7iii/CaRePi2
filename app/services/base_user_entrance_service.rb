class BaseUserEntranceService < BaseService
  def send_slack_notification(blocks:)
    slack_client.chat_postMessage(channel: ENV['SLACK_CHANNEL_ID'], blocks:)
  end

  private

  def slack_client
    @slack_client ||= Slack::Web::Client.new(token: ENV['SLACK_ACCESS_TOKEN'])
  end
end
