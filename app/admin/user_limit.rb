ActiveAdmin.register UserLimit do

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


  permit_params :ammount, :user_type, :limit_type, :created_at, :updated_at

  index do
    selectable_column
    id_column
    column :ammount
    column :user_type
    column :limit_type
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :ammount
      f.input :user_type
      f.input :limit_type
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end

end