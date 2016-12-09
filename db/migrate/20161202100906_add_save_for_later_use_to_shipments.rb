class AddSaveForLaterUseToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :save_for_later_use, :boolean, null: false, default: false
  end
end
