class MyAccount < SitePrism::Page
  set_url 'http://10.131.11.115/my/account'

  element :api_access_key_show_link, :xpath, '//*[@id="sidebar"]/div/a'
  element :api_access_key,'#api-access-key'

end