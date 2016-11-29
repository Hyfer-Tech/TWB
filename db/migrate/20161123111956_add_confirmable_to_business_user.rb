class AddConfirmableToBusinessUser < ActiveRecord::Migration[5.0]
    def up
    add_column :business_users, :confirmation_token, :string
    add_column :business_users, :confirmed_at, :datetime
    add_column :business_users, :confirmation_sent_at, :datetime
    # add_column :business_users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :business_users, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # business_users as confirmed, do the following
    execute("UPDATE business_users SET confirmed_at = NOW()")
    # All existing user accounts should be able to log in after this.
    # Remind: Rails using SQLite as default. And SQLite has no such function :NOW.
    # Use :date('now') instead of :NOW when using SQLite.
    # => execute("UPDATE business_users SET confirmed_at = date('now')")
    # Or => User.all.update_all confirmed_at: Time.now
  end

  def down
    remove_columns :business_users, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :business_users, :unconfirmed_email # Only if using reconfirmable
  end
end
