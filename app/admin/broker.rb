ActiveAdmin.register Broker do

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

permit_params :first_name, :last_name, :email, :password, :password_confirmation, :phone, :city, :zip_postal_code, :state_province_county, :country, :firm_name, :address_line_1, :specialty, :service_rates, :broker_number  

  index do
    selectable_column
    id_column
    column :email
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
      f.input :city
      f.input :zip_postal_code
      f.input :state_province_county
      f.input :country
      f.input :firm_name
      f.input :address_line_1
      f.input :specialty
      f.input :service_rates
      f.input :broker_number
    end
    f.actions
  end
end
