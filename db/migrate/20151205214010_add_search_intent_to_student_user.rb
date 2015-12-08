class AddSearchIntentToStudentUser < ActiveRecord::Migration
  def change
    add_column :student_users, :search_intent, :string
  end
end
