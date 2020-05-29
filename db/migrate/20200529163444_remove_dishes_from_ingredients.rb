class RemoveDishesFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :dishes_id, :bigint
  end
end
