class LoginPage < SitePrism::Page
  set_url 'http://10.131.11.115'

  element :sign_in_button, :xpath, '//*[@id="account"]/ul/li[1]/a'

  element :email_field, '#username'
  element :password_field, '#password'
  element :login_button, '#login-submit'
end