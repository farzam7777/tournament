class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, :numericality => true, :length => { :minimum => 10, :maximum => 15 }

  has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200>" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :teams, dependent: :destroy
  has_many :players, dependent: :destroy

  def to_s
    first_name + " " + last_name
  end
end
