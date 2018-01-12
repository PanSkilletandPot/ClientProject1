class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :ingredient, uniqueness: true
  validates :ingredient, :recipe, presence: true

end
