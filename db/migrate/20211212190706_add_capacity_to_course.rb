class AddCapacityToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :capacity, :integer, default: 0
  end
end
