namespace :notification do
  desc "notification delete"
  task delete: :environment do
    students = Student.all
    students.each do |student|
      student.notifications.where.not(read_at:nil).delete_all
    end
  end
end
