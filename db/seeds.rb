password = "secret123"

Admin.create!(
  first_name: "Admin",
  last_name: "Admin",
  email: "admin@akademy.com",
  password: password
)
puts '1 Admin added to the database'

teacher = Teacher.create!(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@akademy.com",
  password: password
)
puts '1 Teacher added to the database'

subject = Subject.create!(name: "English", teacher_id: teacher.id)
puts '1 Subject added to the database'

3.times do |index|
  Group.create!(
    name: "Group #{index}",
    subject_id: subject.id,
    lesson_price: "50000",
    lesson_duration_in_minutes: 90
  )
end
puts "3 groups added to the database"
