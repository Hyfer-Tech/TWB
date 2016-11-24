class CreateUserLimits < ActiveRecord::Migration[5.0]
  def change
  	return if table_exists? :user_limits
    create_table :user_limits do |t|
    	t.integer :amount
    	t.string :user_type
    	t.integer :limit_type
      t.timestamps
    end
  end
end
