ActiveAdmin.register Coach do
	permit_params :first_name, :last_name, :phone, :email, :coach_status, :image

	form do |f|
		f.inputs "Coach Details" do
			f.input :first_name
			f.input :last_name
			f.input :phone
			f.input :email
			f.input :coach_status
			f.input :image
		end
		f.button :submit
	end

	index do
    selectable_column
    column :first_name
    column :last_name
    column :phone
    column :email
    column :coach_status
    actions
  end

  filter :first_name
  filter :last_name
  filter :phone
  filter :email
  filter :coach_status

end
