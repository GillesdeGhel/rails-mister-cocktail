class Cocktail < ApplicationRecord
  has_many :reviews, dependent: :delete_all
  has_many :doses, dependent: :delete_all
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader
end
