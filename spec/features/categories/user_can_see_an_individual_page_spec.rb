require 'rails_helper'

describe "User sees a single category" do
  scenario "a user can see the category" do
    category = Category.create(title: "Development")

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Development")

  end
end
