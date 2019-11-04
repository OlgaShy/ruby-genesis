require 'securerandom'

feature "the new user checks", js: true  do
  scenario 'checking issues' do
    @registration_page = RegistrationPage.new
    @registration_page.load

    expect(page).to have_content 'Redmine'

    sleep 2

    random_value = SecureRandom.hex(8).to_s
    new_user = 'test_user_' + random_value

    register_user new_user

    expect(page). to have_content 'Your account has been activated. You can now log in'

    sleep 2

    @top_menu = TopMenu.new
    @top_menu.load

    @top_menu.my_page_link.click

    expect(page).to have_content 'My page'
    expect(current_url).to include '/my/page'

    sleep 3

    a = 'Issues assigned to me (0)'.to_i
=begin
     if a == 0
       puts "No issues assigned to you"
     else
       puts "You have new issues assigned to you"
     end
=end
    expect a == 0

    b = 'Reported issues (0)'.to_i
=begin
      if b == 0
        puts "There is no issues reported by you"
      else
        puts "You have issues reported by you"
      end
=end
    expect b == 0


    sleep 5

   end
end