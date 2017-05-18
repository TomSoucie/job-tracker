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

describe "User updates a job" do
  scenario "a user sees a specific job" do
    #create the objects
    company = Company.create!(name: "Dish")
    job = company.jobs.create!(title: "Developer", level_of_interest: 85. city: "Denver")
    #visit company_job_path(company, job)
    visit company_job_path(company, job)
    #and I click_on "Edit Job"
    click_on "Edit Job"
    expect(page).to have_content(company.name)
    expect(page).to have_content(job.city)
    #and I update the title: and level_of_interest:
    fill_in "Level of Interest", with: 70
    fill_in "City", with: "Greenwood Village"
    click_on "Submit"
    #expect(page).to have_content(Updated parameters)
    expect(page).to have_content("Greenwood Village")
    expect(page).to have_content(70)
  end
end
