class Sport < ApplicationRecord
	has_many :teams, dependent: :destroy
	has_many :playings, dependent: :destroy
	has_many :championships, dependent: :destroy

	def to_s
		name
	end
end
