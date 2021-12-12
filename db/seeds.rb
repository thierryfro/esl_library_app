require 'faker'

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
    student_id: User.where(role: 2).sample.id,
    teacher_id: User.where(role: 1).sample.id
  )
  unless course.save
    puts "Was not possible to create teacher: #{course.inspect}"
  end
  puts "Course #{course.name} created successfully."
end
puts "#{Course.count} courses created."

