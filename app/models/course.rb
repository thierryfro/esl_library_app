class Course < ApplicationRecord
  # callbacks
  after_save :notify_teacher

  # validations
  validate :check_capacity
  validate :check_course_rules

  # relations
  belongs_to :teacher, class_name: 'User'
  belongs_to :student, class_name: 'User'


  def check_capacity
    errors.add(:capacity, "This course is full") if self.capacity >= 30
  end

  def check_course_rules
    teachers_course = Course.where(teacher_id: self.teacher_id)
    if teachers_course.size >= 2
      errors.add(:teacher_id, "You can only teach 2 courses at same time")
    elsif self.teacher_id == self.student_id
      errors.add(:base, "You cannot be a teacher and student at same course")
    end
  end

  def notify_teacher
    if saved_change_to_capacity?
      puts "Hi #{self.teacher.name}, #{self.student.name} just joined your #{self.name} course!"
    end
  end

end
