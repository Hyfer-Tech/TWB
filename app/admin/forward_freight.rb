ActiveAdmin.register ForwardFreight do

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
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :phone, :address_line_1, :city, :state_province_county, :zip_postal_code, :service_rates, :country 

  index do
    selectable_column
    id_column
    column :first_name
    column :email
    column :View_Profile   do |a|
        link_to "View", broker_path(a.id)
      end 
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
    f.input :first_name
    f.input :last_name
    f.input :email
    f.input :password
    f.input :password_confirmation
    f.input :phone
    f.input :address_line_1
    f.input :city
    f.input :state_province_county
    f.input :zip_postal_code
    f.input :service_rates    
    f.input :country    
	end
    f.actions
  end

end
