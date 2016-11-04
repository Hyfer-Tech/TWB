class DeviseCreateBusinessUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :business_users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :business_name
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.text :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city
      t.string :state_province_county
      t.string :country
      t.timestamps null: false
    end

    add_index :business_users, :first_name
    add_index :business_users, :last_name
    add_index :business_users, :email,                unique: true
    add_index :business_users, :reset_password_token, unique: true
    # add_index :business_users, :confirmation_token,   unique: true
    # add_index :business_users, :unlock_token,         unique: true
  end
end
