class AddFieldsToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :fta_tt, :string
    add_column :jobs, :insured, :string
    add_column :jobs, :type_of_job, :string
    add_column :jobs, :canada_cost_invoice, :string
    add_column :jobs, :commercial_invoice, :string
    add_column :jobs, :free_trade_certificate, :string
    add_column :jobs, :form_A, :string
    add_column :jobs, :bill_of_lading, :string
  end
end
