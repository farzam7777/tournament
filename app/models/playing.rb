class Playing < ApplicationRecord
	belongs_to :player
	belongs_to :team
	belongs_to :sport

	validates_uniqueness_of :player_id, scope: :team_id
	validates_uniqueness_of :player_id, scope: :sport_id
	validate :satisfy_playing_option?

  def satisfy_playing_option?
    if (self.player.playing_option == 'one') && (self.player.teams.count >= 1)
    	errors[:base] << self.player.full_name + ' can only play in one team'
    	return false
    else
    	return true
    end
  end
end
