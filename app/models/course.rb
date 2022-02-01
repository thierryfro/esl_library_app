class Course < ApplicationRecord
  # callbacks
  after_save :notify_teacher

  # validations
  validates_numericality_of :capacity, less_than_or_equal_to: 30, message: "Courses cant have more then 30 students"

  # relations
  has_many :student_courses
  has_many :students, through: :student_courses

  has_many :teacher_courses
  has_many :teachers, through: :teacher_courses

  def notify_teacher
    if saved_change_to_capacity?
      puts "Hi #{self.teacher.name}, #{self.student.name} just joined your #{self.name} course!"
    end
  end

end
