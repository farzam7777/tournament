ActiveAdmin.register Championship do
	permit_params :logo, :name, :description, :tag_line, :address, :date, :start_time, :phone, :email, :url, :cutoff_date, 
								:number_allowed, :tournament_fee, :tournament_status, :sport_id

	form do |f|
    f.inputs "Player Details" do
      f.input :sport
      f.input :name
      f.input :description
      f.input :tag_line
      f.input :address
      f.input :date, as: :date_picker, input_html: { style: 'width: 78% !important' }
      f.input :start_time, as: :time_picker
      f.input :logo, :as => :file, :hint => f.object.logo.present? \
      ? image_tag(f.object.logo.url(:thumb))
      : content_tag(:span, "no Logo yet") 
      f.input :phone
      f.input :email
      f.input :url
      f.input :cutoff_date, as: :time_picker
      f.input :number_allowed
      f.input :tournament_fee
      f.input :tournament_status
    end
    f.button :Submit
  end 

  index do
    selectable_column
    column :id
    column :sport
    column :name
    column :address
    column :date
    column :start_time
    column :phone
    column :email
    column :cutoff_date
    column :number_allowed
    column :tournament_fee
    actions
  end

  show do
    attributes_table do
      row :id
      row :sport
      row :name
      row :description
      row :tag_line
      row :address
      row :date
      row :start_time
      row :logo do
        image_tag championship.logo.url(:medium)
      end
      row :phone
      row :email
      row :phone
      row :email
      row :url
      row :cutoff_date
      row :number_allowed
      row :tournament_fee
      row :tournament_status

  	end  
    active_admin_comments
  end

  filter :sport
  filter :name
  filter :address
  filter :date
  filter :start_time
  filter :phone
  filter :email
  filter :number_allowed
  filter :tournament_fee

end
