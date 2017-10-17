json.extract! team, :id, :team_name, :team_status, :team_logo, :coach_id, :created_at, :updated_at
json.url team_url(team, format: :json)
