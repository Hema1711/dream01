ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :email, :password, :phone_number, :file_extension, :language
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :password, :phone_number, :file_extension, :language]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  actions :index, :edit, :update, :create, :destroy,:new
  permit_params :first_name, :last_name, :email, :password, :phone_number, :file_extension, :language
  
  # menu label: "User"

  # index do
  #   column :first_name
  #   column :last_name
  #   column :email
  #   column :password
  #   column :phone_number
  #   column :file_extension
  #   column :language
  # end

  # filter :first_name
  # filter :email

  # controller { actions :all, except: [:destroy] }
 
end
