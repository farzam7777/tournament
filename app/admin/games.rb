ActiveAdmin.register Game do
	permit_params :round_id, :team1_id, :team2_id, :team1_score, :team2_score, :scheduled_date, :actual_date, :game_status
end
