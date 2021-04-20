class AddQuantityToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :quantity, :integer
    add_column :courses, :timer, :integer
  end
end
