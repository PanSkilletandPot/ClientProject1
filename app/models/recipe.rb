class Recipe < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_many :ingredients, dependent: :destroy
end
