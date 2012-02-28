class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.decimal :amount
      t.integer :invoice_number
      t.date :due_at
      t.date :sent_at
      t.string :subject
      t.string :remit_to
      t.text :notes

      t.timestamps
    end
  end
end
