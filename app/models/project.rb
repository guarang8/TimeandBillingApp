class Project < ActiveRecord::Base
  belongs_to :client
  has_and_belongs_to_many :tasks
  validates_numericality_of :budget
  validates_presence_of :name
  validates_presence_of :client_id
  validates_numericality_of :hour_cap
end
