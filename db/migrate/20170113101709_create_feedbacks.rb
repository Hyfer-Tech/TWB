class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :audit_id
      t.integer :agent_id

      t.timestamps
    end
    add_index :feedbacks, :audit_id
    add_index :feedbacks, :agent_id
    add_index :feedbacks, [:audit_id,:agent_id]
  end
end
