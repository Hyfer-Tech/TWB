class AddBodyToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :body, :text
  end
end
