ActiveAdmin.register Team do

  permit_params :team_name, :team_status, :team_logo, :coach_id, :sport_id, :players_capacity

  form do |f|
  	f.inputs "Team Details" do
  		f.input :sport
  		f.input :coach
	  	f.input :team_name
	  	f.input :team_status
	  	f.input :team_logo
	  	f.input :players_capacity
	  end
	  f.button :submit
	end

	filter :coach
	filter :team_name
	filter :players_capacity
end
