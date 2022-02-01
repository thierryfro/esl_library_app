class CreateTeacherCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_courses do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
