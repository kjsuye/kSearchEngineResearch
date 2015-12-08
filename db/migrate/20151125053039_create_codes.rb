class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :logInCode
      t.string :searchOption
      t.string :querySuggestion
      t.integer :timesUsed

      t.timestamps null: false
    end
  end
end
