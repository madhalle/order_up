class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  # def top_picks
  #
  #   dishes.each do |dish|
  #     dish.ingredients.max(3) do |ingredient|
  #       ingredient.dishes.count
  #     end
  #   end
  #   # require "pry"; binding.pry
  # end
end
