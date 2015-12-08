class Code < ActiveRecord::Base
  before_save :default_values
  def default_values
    self.timesUsed ||= 0
  end
  validates :logInCode, presence: true
  validates :searchOption, presence: true
  validates :querySuggestion, presence: true
  validates :search_intent, presence: true
end
