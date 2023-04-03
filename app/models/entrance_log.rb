class EntranceLog < ApplicationRecord
  belongs_to :user

  def self.enter!(user:)
    create!(user:, entered_at: Time.current)
  end

  def self.exit!(user:)
    log = latest_enter_log(user:) || create(user:)
    log.update!(exited_at: Time.current)
    log
  end

  def self.latest_enter_log(user:)
    latest_log = EntranceLog.where(user:).last
    return nil if latest_log.nil?
    return nil if latest_log.entered_at.blank? || latest_log.exited_at.present?

    latest_log
  end
end
