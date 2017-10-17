class Playing < ApplicationRecord
	belongs_to :player
	belongs_to :team
end
