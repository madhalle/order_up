require 'rails_helper'

RSpec.describe "when visiting the dishes show page" do
  before :each do
    @chef1 = Chef.create!(name: "Madeleine")
    @dish1 = @chef1.dishes.create!(name: "Ramen Noodles", description: "Delicious, absolutely delicious")
    @noodles = @dish1.ingredients.create!(name: "noodles", calories: 200)
    @egg = @dish1.ingredients.create!(name: "soft boiled egg", calories: 20)
    @broth = @dish1.ingredients.create!(name: "veggie broth", calories: 20)
    @vegetables = @dish1.ingredients.create!(name: "veggies", calories: 40)
  end
  it "will see list of ingredients for dish and chefs name" do
    visit "/dishes/#{@dish1.id}"

    expect(page).to have_content(@chef1.name)
    expect(page).to have_content(@noodles.name)
    expect(page).to have_content(@egg.name)
    expect(page).to have_content(@broth.name)
    expect(page).to have_content(@vegetables.name)
  end

  it "will see total calorie count of dish" do
    visit "/dishes/#{@dish1.id}"

    expect(@dish1.total_cals).to eq(280)
    expect(page).to have_content(@dish1.total_cals)
  end

end
# # Order up is an app that tracks chefs, the dishes that they make, and the ingredients that are in those dishes. Chef's have many dishes. Dishes belong to a chef. Dishes have many Ingredients and Ingredients have many dishes. Ingredients should have name and calories.
# Story 2 of 3
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
