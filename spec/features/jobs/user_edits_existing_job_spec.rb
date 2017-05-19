require 'rails_helper'

=begin
As a user
Given a job exists
When I visit the job edit page
And I change the city and level_of_interest
And I click "Submit"
Then I should see the updated job parameters
=end

describe "User edits existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "Dish")
    job = company.jobs.create!(title: "Developer", description: "Good depending location",
    level_of_interest: 85, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[description]", with: "Located outside of Denver"
    fill_in "job[level_of_interest]", with: 70
    fill_in "job[city]", with: "Greenwood Village"
    # byebug
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("outside")
    expect(page).to have_content("Greenwood Village")
    expect(page).to have_content(70)

  end
end
