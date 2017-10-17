class Player < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "200x200>" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
  validates :email, presence: true
  validates :dob, presence: true
  validates :player_status, presence: true

  has_many :playings
  has_many :teams, through: :playings

  def to_s
    first_name + " " + last_name
  end
end
