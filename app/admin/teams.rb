ActiveAdmin.register Team do

  permit_params :team_name, :team_status, :team_logo, :coach_id, :sport_id

  form do |f|
  	f.inputs "Team Details" do
  		f.input :sport
  		f.input :coach
	  	f.input :team_name
	  	f.input :team_status
	  	f.input :team_logo
	  end
	  f.button :submit
	end

	filter :coach
	filter :team_name
end
