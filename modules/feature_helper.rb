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

  def register_project_admin_user (new_admin)
    @registration_page.register_button.click
    expect(current_url).to include '/account/register'

    @registration_page.login_field.set new_admin
    @registration_page.password_field.set 'qwerty123456'
    @registration_page.confirmation_field.set 'qwerty123456'
    @registration_page.first_name_field.set 'Jhon'
    @registration_page.last_name_field.set 'Admin'
    @registration_page.email_field.set new_admin + '@g.com'
    #@register_page.language_dropdown.select 'English (British)' from: 'Language'
    @registration_page.submit_button.click

=begin
    @my_account = MyAccount.new
    @my_account.load

    @my_account.api_access_key_show_link.click

    File.open('features/admin_api_key.json', 'w') do |file|
      require 'json'
      file.puts. a.to_json
      sleep 2
    end

=end
    sleep 2

    File.open('features/admin_cred.json', 'w') do |file|
      require 'json'
      file.puts new_admin.to_json
      sleep 2
    end


  end

  def create_new_project (new_project)
    @project_tab.new_project_button.click
    expect(current_url).to include '/projects/new'

    sleep 2

    @project_tab.name_field.set new_project
    @project_tab.identifier_field.set new_project
    @project_tab.create_button.click

    File.open('features/Test project', 'w') do |file|
      require 'json'
      file.puts new_project.to_json

      sleep 5

    end

  end

end