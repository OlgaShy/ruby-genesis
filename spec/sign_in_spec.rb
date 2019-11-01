feature "the signin process", js: true  do

  scenario 'signs me in' do
    visit 'http://10.131.11.115/'
    click_link 'Sign in'
    expect(page).to have_content 'Redmine'
    expect(current_url).to include '/login'
     find_field(id: 'username').fill_in 'username', with: 'user'
    sleep 5
fill_in '//*[@id="password"]', with: 'XYPZw2QLwQb4'
click_button 'login'
sleep 5

end
end