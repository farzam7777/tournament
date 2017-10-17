class Team < ApplicationRecord
	has_attached_file :team_logo, styles: { medium: "300x300>", thumb: "100x100#" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")

  validates_attachment_content_type :team_logo, content_type: /\Aimage\/.*\z/

  belongs_to :coach
  has_many   :players, dependent: :destroy

  accepts_nested_attributes_for :players, :allow_destroy => true
end
