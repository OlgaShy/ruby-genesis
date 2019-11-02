require 'securerandom'

feature "the registration process", js: true  do
  scenario 'gerister me in' do
    @registration_page = RegistrationPage.new
    @registration_page.load

    expect(page).to have_content 'Redmine'

    sleep 2
    @registration_page.register_button.click

    expect(current_url).to include '/account/register'

    random_value = SecureRandom.hex(8).to_s

    @registration_page.login_field.set 'test_user_' + random_value
    @registration_page.password_field.set 'qwerty123456'
    @registration_page.confirmation_field.set 'qwerty123456'
    @registration_page.first_name_field.set 'Jhon'
    @registration_page.last_name_field.set 'Smith'
    @registration_page.email_field.set 'JS' + random_value + '@g.com'
    #@register_page.language_dropdown.select 'English (British)' from: 'Language'
    @registration_page.submit_button.click

    expect(page). to have_content 'Your account has been activated. You can now log in'

    sleep 5
    end
end
