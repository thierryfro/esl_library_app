class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :teacher, null: false
      t.references :student, null: false

      t.timestamps
    end
  end
end
