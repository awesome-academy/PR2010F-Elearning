require_relative "environment"
set :environment, Rails.env
set :output, "log/cron_job.log"
every 1.minutes do
  rake "delete:delete_notifications"
end
every 1.minutes do
  rake "batch:send_messages"
end
