require 'faker'

User.destroy_all
Course.destroy_all
TeacherCourse.destroy_all
StudentCourse.destroy_all

100.times do
  teacher = User.new(
              name: Faker::Name.name,
              email: Faker::Internet.email,
              country: Faker::Address.country,
              role: 1,
            )
  unless teacher.save
    puts "Was not possible to create teacher: #{teacher.inspect}"
  end
  puts "Teacher #{teacher.name} created successfully."
end

puts "#{User.where(role: 1).count} teachers created."

1000.times do
  student = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    country: Faker::Address.country,
    role: 2,
  )
  unless student.save
    puts "Was not possible to create teacher: #{student.inspect}"
  end
  puts "Student #{student.name} created successfully."
end
puts "#{User.where(role: 2).count} students created."


50.times do
  course = Course.create(
    name: Faker::Educator.course_name,
  )
  unless course.save
    puts "Was not possible to create teacher: #{course.inspect}"
  end
  puts "Course #{course.name} created successfully."
end
puts "#{Course.count} courses created."

50.times do
  teacher_course = TeacherCourse.create(
    course_id: Course.all.sample.id,
    user_id: User.where(role: 1).sample.id,
  )
  unless teacher_course.save
    puts "Was not possible to create teacher: #{teacher_course.inspect}"
  end
  puts "TeacherCourse #{teacher_course.id} created successfully."
end
puts "TeacherCourse: #{TeacherCourse.count} courses created."

50.times do
  student_course = StudentCourse.create(
    course_id: Course.all.sample.id,
    user_id: User.where(role: 2).sample.id,
  )
  unless student_course.save
    puts "Was not possible to create teacher: #{student_course.inspect}"
  end
  puts "StudentCourse #{teacher_course.id} created successfully."
end
puts "StudentCourse: #{StudentCourse.count} courses created."

