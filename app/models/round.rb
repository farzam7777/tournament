class Round < ApplicationRecord
	belongs_to :championship
	has_many 	 :games, dependent: :destroy
end
