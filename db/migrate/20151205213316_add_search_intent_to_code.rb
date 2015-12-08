class AddSearchIntentToCode < ActiveRecord::Migration
  def change
    add_column :codes, :search_intent, :string
  end
end
