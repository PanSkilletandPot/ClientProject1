User.delete_all
Recipe.delete_all
Review.delete_all

def user_params
  {
    username:Faker::Seinfeld.character,
    email:Faker::Internet.email,
    passowrd:Faker::Internet.password
  }
end

def categories
  ["appetizer", "main_course", "dessert", "salad"].sample
end

def ingredients
  Faker::Food.ingredient
end

def recipe_params
  {
    recipe_name:Faker::Food.dish,
    category: categories.sample,
    ingredients: Faker::Food.ingredient

  }
