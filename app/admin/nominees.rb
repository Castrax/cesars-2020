ActiveAdmin.register Nominee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title_text, :category_id, :subtitle_text, :title_photo, :subtitle_photo
  #
  # or
  #
  permit_params do
    permitted = [:title_text, :category_id, :subtitle_text, :title_photo, :subtitle_photo]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
