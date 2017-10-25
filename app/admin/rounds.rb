ActiveAdmin.register Round do
	permit_params :championship_id, :scheduled_Date, :actual_date, :round_status
end
