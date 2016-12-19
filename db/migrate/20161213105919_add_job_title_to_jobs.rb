class AddJobTitleToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_title, :string
  end
end
