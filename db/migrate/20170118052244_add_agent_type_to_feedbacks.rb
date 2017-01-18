class AddAgentTypeToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :agent_type, :string
  end
end
