class JournalEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_one :task
  validates_numericality_of :hours
end