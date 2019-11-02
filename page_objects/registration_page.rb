class RegistrationPage < SitePrism::Page
  set_url 'http://10.131.11.115'

  element :register_button, :xpath, '//*[@id="account"]/ul/li[2]/a'

  element :login_field, '#user_login'
  element :password_field, '#user_password'
  element :confirmation_field, '#user_password_confirmation'
  element :first_name_field, '#user_firstname'
  element :last_name_field, '#user_lastname'
  element :email_field, '#user_mail'
  element :language_dropdown, '#user_language'
  element :submit_button, '#new_user > input[type=submit]:nth-child(4)'
end