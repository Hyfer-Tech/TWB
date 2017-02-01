class AddFieldsToAudits < ActiveRecord::Migration[5.0]
  def change
    add_column :audits, :b3_customs_entry, :string
    add_column :audits, :previous_ruling, :string
  end
end
