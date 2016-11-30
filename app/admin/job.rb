ActiveAdmin.register Job do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :job_type, :shipment_id, :created_at, :updated_at, :client_id, :agent_id, :client_type, :agent_type, :date_of_shipment, :location_of_shipment, :place_being_shipped_to, :border_expected_to_cross

  index do
    selectable_column
    id_column
    column :job_type
    column :shipment_id
    column :created_at
    column :updated_at
    column :client_id
    column :agent_id
    column :client_type
    column :date_of_shipment
    column :location_of_shipment
    column :place_being_shipped_to
    column :border_expected_to_cross
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :job_type
      f.input :shipment_id
      f.input :created_at
      f.input :updated_at
      f.input :client_id
      f.input :agent_id
      f.input :client_type
      f.input :agent_type
      f.input :date_of_shipment
      f.input :location_of_shipment
      f.input :place_being_shipped_to
      f.input :border_expected_to_cross


    end
    f.actions
  end
end
