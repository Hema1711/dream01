ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  actions :index, :edit, :update, :create, :destroy, :new
  permit_params :user_id, :total, :cart_id, :payment_id, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :total, :cart_id, :payment_id, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
