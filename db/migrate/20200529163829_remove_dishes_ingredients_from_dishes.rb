class RemoveDishesIngredientsFromDishes < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :dishes_ingredients_id, :bigint
  end
end
