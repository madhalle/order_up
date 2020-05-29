require 'rails_helper'
RSpec.describe "when visiting chefs show page" do
  before :each do
    @chef1 = Chef.create!(name: "Madeleine")
    @chef2 = Chef.create!(name: "Bri")
    @dish1 = @chef1.dishes.create!(name: "Ramen Noodles", description: "Delicious, absolutely delicious")
    @dish2 = @chef2.dishes.create!(name: "Scrambled eggs", description: "Delicious, absolutely delicious")
    @noodles = Ingredient.create!(name: "noodles", calories: 200)
    @egg = Ingredient.create!(name: "soft boiled egg", calories: 20)
    @egg = Ingredient.create!(name: "soft boiled egg", calories: 20)
    @milk = Ingredient.create!(name: "Milk", calories: 60)
    @broth = Ingredient.create!(name: "veggie broth", calories: 20)
    @vegetables = Ingredient.create!(name: "veggies", calories: 40)
    # @noodles = @dish1.ingredients.create!(name: "noodles", calories: 200)
    # @egg = @dish1.ingredients.create!(name: "soft boiled egg", calories: 20)
    # @egg = @dish2.ingredients.create!(name: "soft boiled egg", calories: 20)
    # @milk = @dish2.ingredients.create!(name: "Milk", calories: 60)
    # @broth = @dish1.ingredients.create!(name: "veggie broth", calories: 20)
    # @vegetables = @dish1.ingredients.create!(name: "veggies", calories: 40)

    DishesIngredient.create!(ingredient: @noodles, dish: @dish1 )
    DishesIngredient.create!(ingredient: @egg, dish: @dish1 )
    DishesIngredient.create!(ingredient: @broth, dish: @dish1 )
    DishesIngredient.create!(ingredient: @vegetables, dish: @dish1 )
    DishesIngredient.create!(ingredient: @milk, dish: @dish2 )
  end

  it "can see name of chef and link to chefs ingredient index" do
    visit "/chefs/#{@chef1.id}"

    expect(page).to have_content(@chef1.name)
    click_link "Chef's Ingredients"

    expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
    expect(page).to have_content(@noodles.name)
    expect(page).to have_content(@egg.name)
    expect(page).to have_content(@broth.name)
    expect(page).to have_content(@vegetables.name)
    expect(page).to_not have_content(@milk.name)
  end

end
# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
