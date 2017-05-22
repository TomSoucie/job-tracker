require 'rails_helper'

describe "User can see all categories" do
  scenario "user can view all categories" do
    category = Category.create(title: "Development")
    category_two = Category.create(title: "Quality")
    category_three = Category.create(title: "Operations")

    visit categories_path

    expect(page).to have_content("Development")
    expect(page).to have_content("Quality")
    expect(page).to have_content("Operations")
  end
end
