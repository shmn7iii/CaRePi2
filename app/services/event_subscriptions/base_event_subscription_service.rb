class BaseEventSubscriptionService < ::BaseService
  private

  def slack_client
    @slack_client ||= Slack::Web::Client.new(token: ENV['SLACK_ACCESS_TOKEN'])
  end
end
