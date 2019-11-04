module FeatureHelper
  def register_user (new_user)
    @registration_page.register_button.click
    expect(current_url).to include '/account/register'

    @registration_page.login_field.set new_user
    @registration_page.password_field.set 'qwerty123456'
    @registration_page.confirmation_field.set 'qwerty123456'
    @registration_page.first_name_field.set 'Jhon'
    @registration_page.last_name_field.set 'Smith'
    @registration_page.email_field.set new_user + '@g.com'
    #@register_page.language_dropdown.select 'English (British)' from: 'Language'
    @registration_page.submit_button.click
  end

end