class AddBorderExpectedToCrossToJobs < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :border_expected_to_cross, :string
  end
end
