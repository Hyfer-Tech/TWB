class DeviseCreateForwardFreights < ActiveRecord::Migration[5.0]
  def change
    create_table :forward_freights do |t|
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
      t.string  :first_name
      t.string  :last_name
      t.text    :description
      t.string  :phone
      t.string  :email
      t.string  :address_line_1
      t.string  :address_line_2
      t.string  :address_line_3
      t.string  :city
      t.integer :zip_postal_code
      t.string  :state_province_county
      t.string  :country
      t.integer :service_rates
      t.string  :avatar

      t.timestamps null: false
    end

    add_index :forward_freights, :email,                unique: true
    add_index :forward_freights, :reset_password_token, unique: true
    # add_index :forward_freights, :confirmation_token,   unique: true
    # add_index :forward_freights, :unlock_token,         unique: true
  end
end
