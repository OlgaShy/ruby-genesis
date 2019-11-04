class MyPage < SitePrism::Page
  set_url 'http://10.131.11.115/my/page'

  element :assigned_issues_link, :xpath, '//*[@id="block-issuesassignedtome"]/h3/a'
  element :reported_issues_link, :xpath, '//*[@id="block-issuesreportedbyme"]/h3/a'

  element :assigned_issues_counter, :xpath, '//*[@id="block-issuesassignedtome"]/h3/text()'
  element :reported_issues_counter, :xpath, '//*[@id="block-issuesreportedbyme"]/h3/text()'
end