class User < ApplicationRecord

  enum role: { teacher: 1, student: 2 }

  # relations
  has_many :student_courses, class_name: 'Course', foreign_key: 'student_id'
  has_many :teacher_courses, class_name: 'Course', foreign_key: 'teacher_id'

end
