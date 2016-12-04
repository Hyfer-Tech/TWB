ActiveAdmin.register Product do

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

permit_params :title, :price, :compare_at_price, :product_code, :height, :width, :grams, :business_user_id

  index do
    selectable_column
    id_column
    column :title
    column :price, :sortable => :price do |p|
    	number_to_currency p.price
    end
    column :compare_at_price
    column :product_code
    column :height
    column :width
    column :grams
    column :business_user_id
    actions
  end


  form do |f|
    f.inputs "Admin Details" do
      f.input :title
      f.input :price
      f.input :compare_at_price
      f.input :product_code
      f.input :height
      f.input :width
      f.input :grams
      f.input :business_user_id
    end
    f.actions
  end

end
