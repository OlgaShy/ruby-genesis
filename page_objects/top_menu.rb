class TopMenu < SitePrism::Page
  set_url 'http://10.131.11.115'

  element :my_page_link, :xpath, '//*[@id="top-menu"]/ul/li[2]/a'
  element :new_project_button, :xpath, '//*[@id="content"]/div[1]/a'

end