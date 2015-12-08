class ChangequeryStringToOriginalQueryStringInQueries < ActiveRecord::Migration
  def change
    rename_column :queries, :queryString, :originalQueryString
  end
end
