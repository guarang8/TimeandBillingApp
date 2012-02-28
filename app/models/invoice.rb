class Invoice < ActiveRecord::Base
  belongs_to :client
  validates_numericality_of :amount
  validates_presence_of :client_id
  validates_presence_of :invoice_number
  validates_presence_of :due_at
  validates_presence_of :sent_at
  validates_presence_of :subject
  validates_presence_of :remit_to
end