class RemoveDishesIngredientsFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :dishes_ingredients_id, :bigint
  end
end
