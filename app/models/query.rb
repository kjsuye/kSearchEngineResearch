class Query < ActiveRecord::Base
  belongs_to :student_user
  validates :originalQueryString, presence: true

end
