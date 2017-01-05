class AddActorTypeAndRecipientTypeToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :actor_type, :string
    add_column :notifications, :recipient_type, :string
  end
end
