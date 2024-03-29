class Task < ActiveRecord::Base
  has_and_belongs_to_many :projects
  validates_presence_of :name
  validates_presence_of :rate
  validates_numericality_of :rate
end