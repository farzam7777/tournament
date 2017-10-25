class Championship < ApplicationRecord
	belongs_to :sport
	has_many   :rounds, dependent: :destroy

	has_attached_file :logo, styles: { medium: "300x300>", thumb: "200x200>" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

end
