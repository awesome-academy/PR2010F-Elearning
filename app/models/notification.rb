class Notification < ApplicationRecord
  belongs_to :student
  after_create_commit {
    NotificationBroadcastJob.perform_later(Notification.count, self)}
  validates :event, presence: true
  scope :unread, ->{where(read_at:nil)}
  scope :read, ->{where.not(read_at:nil)}
end
