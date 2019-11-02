feature "the signin process", js: true  do
  scenario 'signs me in' do
    @login_page = LoginPage.new
    @login_page.load

    #visit 'http://10.131.11.115/'
    expect(page).to have_content 'Redmine'

    sleep 2
   # click_link 'Sign in'
    @login_page.sign_in_button.click

     expect(current_url).to include '/login'

    #find('#username').set 'user'
   # find('#password').set 'XYPZw2QLwQb4'
   # click_button 'login'
    @login_page.email_field.set 'user'
    @login_page.password_field.set 'XYPZw2QLwQb4'
    @login_page.login_button.click

    expect(page). to have_content 'Logged in as user'

    sleep 5

  end
end