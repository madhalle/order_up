class AddDishesIngredientsToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_reference :ingredients, :dishes_ingredients, foreign_key: true
  end
end
