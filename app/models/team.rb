class Team < ApplicationRecord
	has_attached_file :team_logo, styles: { medium: "300x300>", thumb: "100x100#" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")

  validates_attachment_content_type :team_logo, content_type: /\Aimage\/.*\z/

  belongs_to :coach
  has_many 	 :playings, dependent: :destroy
  has_many   :players, through: :playings
  belongs_to :sport

  accepts_nested_attributes_for :playings, :allow_destroy => true

  validates :team_name, presence: true
  validates :team_status, presence: true
  validates :team_logo, presence: true

  def to_s
    team_name
  end
end
