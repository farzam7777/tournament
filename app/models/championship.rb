class Championship < ApplicationRecord
	belongs_to :sport
	has_many   :rounds, dependent: :destroy
end
