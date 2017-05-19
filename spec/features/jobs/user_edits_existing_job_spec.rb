require 'rails_helper'

=begin
As a user
Given a job exists
When I visit the company job page
And I click "Edit Job"
And I change the city and level_of_interest
And I click "Submit"
Then I should see the updated job parameters
=end

describe "User edits existing job" do
  scenario "a user can edit a job job" do

    company = Company.create!(name: "Dish")
    job = company.jobs.create!(title: "Developer", description: "Good depending location",
    level_of_interest: 85, city: "Denver")

    visit company_job_path(company, job)

    click_on "Edit Job"
    expect(page).to have_content(company.name)
    expect(page).to have_content(job.city)

    fill_in "Desription", with: "Located outside of Denver"
    fill_in "Level of Interest", with: 70
    fill_in "City", with: "Greenwood Village"
    click_on "Submit"

    expect(page).to have_content("outside")
    expect(page).to have_content("Greenwood Village")
    expect(page).to have_content(70)

  end
end
