ActiveAdmin.register Player do

  permit_params :first_name, :last_name, :phone, :email, :dob, :photo, :player_status, :coach_id, :playing_option

  form do |f|
    f.inputs "Player Details" do
      f.input :coach
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :email
      f.input :dob, as: :datepicker
      f.input :photo, :as => :file, :hint => f.object.photo.present? \
      ? image_tag(f.object.photo.url(:thumb))
      : content_tag(:span, "no image yet") 
      f.input :player_status
      f.input :playing_option, as: :select, collection: [ 'one', 'many' ]
    end
    f.button :Submit
  end

  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :playing_option
    column :phone
    column :email
    column :dob
    column :player_status
    column :coach
    actions
  end

  show do
    attributes_table do
      row :id
      row :coach
      row :first_name
      row :last_name
      row :phone
      row :email
      row :dob
      row :photo do
        image_tag player.photo.url(:medium)
      end
      row :playing_option
      row :player_status
  	end  
    active_admin_comments
  end

  filter :coach
  filter :first_name
  filter :last_name
  filter :phone
  filter :email
  filter :dob
  filter :player_status
  filter :playing_option, as: :select, collection: [ 'one', 'many' ]
end
