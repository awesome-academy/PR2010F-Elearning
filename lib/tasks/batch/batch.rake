namespace :batch do
  desc "TODO"
  task send_messages: :environment do
    students = Student.all
    students.each do |student|
      noti = Notification.create event: "Hello #{student.name}, Here are your test results today", student_id: student.id
      puts "#{noti.event} #{student.name}"
    end
  end
end
