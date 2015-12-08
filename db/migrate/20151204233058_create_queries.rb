class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :queryString
      t.json :topLinks
      t.json :linksClicked
      t.references :student_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
