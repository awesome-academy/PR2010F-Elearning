class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :test_id
      t.integer :question_id
      t.integer :answer_id
      t.float :mark
      t.timestamps
    end
  end
end
