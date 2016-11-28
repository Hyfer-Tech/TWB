class AddColumnsToJobs < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :date_of_shipment, :date
  	add_column :jobs, :location_of_shipment, :string
  	add_column :jobs, :place_being_shipped_to, :string
  end
end
