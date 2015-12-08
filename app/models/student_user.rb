class StudentUser < ActiveRecord::Base
  validates :logInCode, presence: true
  has_many :queries

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names + ['queryId', 'originalQueryString', 'topLinks', 'linksClicked', 'student_user_id', 'query_created_at', 'query_updated_at', 'updatedQueryString']
      all.each do |student|
        student.queries.each do |query|
          csv << student.attributes.values_at(*StudentUser.column_names) + query.attributes.values
        end
      end
    end
  end

end
