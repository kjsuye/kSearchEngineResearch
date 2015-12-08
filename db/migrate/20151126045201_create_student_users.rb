class CreateStudentUsers < ActiveRecord::Migration
  def change
    create_table :student_users do |t|
      t.string :logInCode
      t.string :searchOption
      t.string :querySuggestion
      t.integer :age
      t.string :grade
      t.string :school

      t.timestamps null: false
    end
  end
end
