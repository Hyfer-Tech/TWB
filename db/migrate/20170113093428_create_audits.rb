class CreateAudits < ActiveRecord::Migration[5.0]
  def change
    create_table :audits do |t|
      t.string :nafta_certificate
      t.string :canada_customs
      t.integer :business_user_id

      t.timestamps
    end
    add_index :audits, :business_user_id
    add_foreign_key :audits, :business_users
  end
end
