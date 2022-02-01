json.extract! @student, :name, :email
if @student.student_courses.present?
  json.student_courses @student.student_courses do |student_course|
    json.extract! student_course.course, :name
  end
else
  json.student_courses "This student is not enrolled in any courses."
end
