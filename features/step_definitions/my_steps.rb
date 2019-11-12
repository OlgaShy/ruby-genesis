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