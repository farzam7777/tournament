class Playing < ApplicationRecord
	belongs_to :player
	belongs_to :team
	belongs_to :sport

	validates_uniqueness_of :player_id, scope: :team_id
	validates_uniqueness_of :player_id, scope: :sport_id
end
