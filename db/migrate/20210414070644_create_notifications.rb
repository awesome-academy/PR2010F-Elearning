class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :event
      t.integer :student_id
      t.datetime :read_at
      t.timestamps
    end
  end
end
