json.set! :students do

  json.array! @students do |student|

    json.extract! student, :name, :email
    if student.student_courses.present?
      json.courses student.student_courses do |course|
        json.extract! course, :name
      end
    end
  end

end

