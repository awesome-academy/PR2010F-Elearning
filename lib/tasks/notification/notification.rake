namespace :notification do
  desc "notification delete"
  task delete: :environment do
    students = Student.all
    students.each do |student|
      notifications = student.notifications.last
      notifications.destroy
    end
  end
end
