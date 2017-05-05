password = "secret123"

attendance_options = [
  {description: "present", bill: true},
  {description: "absent", bill: true},
  {description: "on vacation", bill: false}
]

attendance_options.each do |option|
  AttendanceOption.create!(option)
end
p "Attendance options created."

Admin.create!(
  email: "admin@akademy.com",
  password: password
)
p "Admin created."

teacher = Teacher.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "teacher@akademy.com",
  password: password
)
p "Teacher created."

students = []
30.times do
  students << Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: password
  )
end
p "30 students created."

groups = []
3.times do |index|
  sample_students = students.sample(Random.rand(7) + 1)
  students -= sample_students
  groups << Group.create!(
    name: "Group #{index}",
    teacher_id: teacher.id,
    students: sample_students
  )
end
p "3 groups created."

7.times do |index|
  PriceDetail.create!(
    teacher_id: teacher.id,
    students_amount: index + 1,
    price: 100000 * (1.to_f/(index+1))
  )
end
p "7 price details created."

lessons = []
20.times do
  lesson_date = Faker::Date.between(90.days.ago, Date.today)
  lessons << Lesson.create!(
    group_id: groups.sample.id,
    duration: 90,
    date: lesson_date
  )
end
p "20 lessons created."

lessons.each do |lesson|
  lesson.group.students.each do |student|
    Attendee.create!(
      lesson_id: lesson.id,
      attendance_option_id: AttendanceOption.all.sample.id,
      student_id: student.id
    )
  end
end
