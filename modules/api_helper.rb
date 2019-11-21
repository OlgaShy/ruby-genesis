require 'rest-client'
require 'securerandom'

module ApiHelper
  def create_user_via_api(new_user)

#    random_value = SecureRandom.hex(8).to_s
#    new_user = 'test_user_' + random_value

  payload = {
      "user" => {
          "login" => new_user,
          "firstname" => 'Jhon',
          "lastname" => 'Smith',
          "mail" => new_user + '@g.com',
          "password" => 'qwerty123456'
      }
  }.to_json
##  api_headers = {"Content-Type" : " ", "" : ""}
  RestClient.post("http://10.131.11.115/" + 'users.json', payload, api_headers)

  end

  def api_headers
    {'Content-Type' => "application/json", 'X-Redmine-API-Key' => "502d2f2aae3113b38f030572028e4852b25eefc8"}
  end
end