class AddUpdatedQueryStringToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :updatedQueryString, :string
  end
end
