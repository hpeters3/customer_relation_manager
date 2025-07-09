ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  config.filters= false
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email_address, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :id
      row :full_name
      row :email_address
      row :phone_number
      row :notes
      row :created_at
      row :updated_at
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), height:  "100"
        else
          status_tag "No Image"
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :email_address
      f.input :phone_number
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
end
