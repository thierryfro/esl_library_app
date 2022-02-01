class User < ApplicationRecord

  enum role: { teacher: 1, student: 2}

  # validations
  validates_presence_of :name, :email
  # validates_uniqueness_of :email, message: "Email allready in use"

  # relations
  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses

  has_many :teacher_courses, dependent: :destroy
  has_many :teachers, through: :teacher_courses

  def user_role
    self.role
  end

end
