class AddOmniauthToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :provider, :string
    add_column :students, :uid, :string
  end
end
