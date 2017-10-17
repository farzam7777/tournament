class Player < ApplicationRecord
  belongs_to :team

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "200x200>" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
