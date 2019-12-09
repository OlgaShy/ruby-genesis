Given(/^I see login page is opened$/) do
  @registration_page = RegistrationPage.new
  @registration_page.load

  expect(page).to have_content 'Redmine'
  sleep 2
end

When(/^I fill in register form and click on the submit button$/) do
  random_value = SecureRandom.hex(8).to_s
  new_user = 'test_user_' + random_value

  register_user new_user
end

Then(/^I became the register user$/) do
  expect(page). to have_content 'Your account has been activated. You can now log in'
  sleep 2
end

Given(/^I see start page is opened$/) do
  @login_page = LoginPage.new
  @login_page.load

  expect(page).to have_content 'Redmine'
  sleep 2

  @login_page.sign_in_button.click
  expect(current_url).to include '/login'
end

When(/^I fill the login form$/) do
  @login_page.email_field.set 'user'
  @login_page.password_field.set 'XYPZw2QLwQb4'
  @login_page.login_button.click
end

Then(/^I became logged in user$/) do
  expect(page). to have_content 'Logged in as user'
  sleep 5
end

When(/^I send correct data for the new user registration$/) do
  random_value = SecureRandom.hex(8).to_s
  new_user = 'test_user_' + random_value
  @response=create_user_via_api(new_user)
end


Then(/^I became a new registered via API user$/) do
  expect(@response.code).to equal 201
  p @response
end

## milestone project

Given(/^I am not logged in visitor$/) do
  @registration_page = RegistrationPage.new
  @registration_page.load

  expect(page).to have_content 'Redmine'
  sleep 2
end

When(/^I register 'admin' user via Redmine 'UI'$/) do
  random_value = SecureRandom.hex(8).to_s
  @new_admin = 'admin_user_' + random_value

  register_project_admin_user @new_admin
  sleep 2
end

Then(/^I see the 'admin' user is registered$/) do
  expect(page). to have_content 'Your account has been activated. You can now log in'
  sleep 2
end

And(/^I become logged in as 'admin' user$/) do
  expect(page). to have_content @new_admin
end

When(/^I create a project$/) do
  @project_tab = ProjectTab.new
  @project_tab.load

  random_value = SecureRandom.hex(8).to_s
  @new_project = 'project' + random_value
  create_new_project @new_project

end

Then(/^I see that project is created on 'UI' level$/) do
  expect(page). to have_content 'Successful creation'
end


And(/^I see that project is created on 'API' level$/) do

  @response = get_project_name

#  File.open('features/response.json', 'w') do |file|
#    require 'json'
#    file.puts @response.to_json

  a = JSON.parse(@response, ['name'])
  b = []
  a.each do |el|
    b.put (el['name'])
  end
  expect(b).to include @new_project

#  end
  end

When(/^I register 'developer' user via Redmine 'API'$/) do
  random_value = SecureRandom.hex(8).to_s
  new_developer = 'developer_user_' + random_value

  @response2 = register_project_developer_user new_developer
  sleep 2
end

Then(/^I see the 'developer' user is registered$/) do
  expect(@response2.code).to equal 201
  p @response2
end

When(/^I add 'developer' user as a member of the project$/) do
  file = open('features/developer_resp.json')
  a = file.read

  dev_id = JSON.parse(a)['id']

  add_user_to_project(dev_id)


end