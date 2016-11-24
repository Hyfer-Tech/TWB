class ConfigureColumnsForShipments < ActiveRecord::Migration[5.0]
  def change
    # return unless table_exists? :shipment_products
    add_index :shipment_products, :product_id
    add_index :shipment_products, :shipment_id
    add_index :shipment_products, [:product_id, :shipment_id]
  end
end
