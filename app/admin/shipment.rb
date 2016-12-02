ActiveAdmin.register Shipment do

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

	permit_params :business_user_id, presence: true
	permit_params :shipment_products, length: {minimum: 1}

    form do |f|
    f.inputs "Admin Details" do
      f.input :broker_id
      f.input :forward_freight_id
      f.input :approval
      f.input :shipment_confirmed
      f.input :created_at
      f.input :updated_at
      f.input :business_user_id
    end
    f.actions
  end
end
