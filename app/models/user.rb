class User < ApplicationRecord
  has_many :entrance_logs

  validates :username, presence: true, uniqueness: true

  before_create do
    self.id = username[...-1]
    self.email = username + ENV['DEFAULT_EMAIL_DOMAIN']
    slack_user = slack_client.users_lookupByEmail(email:)
    self.slack_user_id = slack_user[:user][:id]
  rescue Slack::Web::Api::Errors::UsersNotFound
    puts "user not found; #{email}"
  end

  def enterd?
    !!EntranceLog.latest_enter_log(user: self)
  end

  private

  def slack_client
    @slack_client ||= Slack::Web::Client.new(token: ENV['SLACK_ACCESS_TOKEN'])
  end
end
