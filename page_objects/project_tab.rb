class ProjectTab < SitePrism::Page
  set_url 'http://10.131.11.115/projects'

  element :new_project_button, :xpath, '//*[@id="content"]/div[1]/a'
  element :name_field, '#project_name'
  element :description, '#project_description'
  element :identifier_field, '#project_identifier'
  element :create_button, :xpath, '//*[@id="new_project"]/input[3]'

end