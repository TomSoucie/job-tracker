require 'rails_helper'

describe "User can edit an existing category" do
  scenario "user can edit a category" do
    category = Category.create(title: "Quality")

    visit edit_category_path(category)

    fill_in "category[title]", with: "Regulatory"
    click_button "Update"

    expect(current_path).to eq("/categories")
    expect(page).to have_content("Regulatory")
    expect(page).to_not have_content("Quality")
  end
end
