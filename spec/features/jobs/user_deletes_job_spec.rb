require 'rails_helper'
=begin
As a user
Given a job exists
When I visit the job index
And I click delete
Then I should see the index page without the job
=end
describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "Oracle")
    job = company.jobs.create(title: "Developer", description: "Backend",
    level_of_interest: 75, city: "Broomfield")

    visit company_jobs_path(company, job)

    click_link "Delete"

    expect(page).to_not have_content("Developer")
    expect(page).to_not have_content("Broomfield")
    expect(page).to_not have_content("Backend")
    expect(page).to_not have_content(75)
  end
end
