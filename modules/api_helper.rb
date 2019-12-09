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

  def get_project_name
    @response1 = RestClient.get("http://10.131.11.115/projects.json", api_headers)

    File.open('features/response1.json', 'w') do |file|
      require 'json'
      file.puts @response1.to_json
    end

  end

  def register_project_developer_user (new_developer)
    payload = {
        "user" => {
            "login" => new_developer,
            "firstname" => 'Jhon',
            "lastname" => 'Dev',
            "mail" => new_developer + '@g.com',
            "password" => 'qwerty123456'
        }
    }.to_json

    File.open('features/developer_cred.json', 'w') do |file|
      require 'json'
      file.puts new_developer.to_json
      sleep 2
    end

    @response2 = RestClient.post("http://10.131.11.115/" + 'users.json', payload, api_headers)
    File.open('features/developer_resp.json', 'w') do |file|
      require 'json'
      file.puts @response2.to_json
      sleep 2
    end

  end

  def add_user_to_project (dev_id)
    payload = {
        "membership" => {
                "user_id" => dev_id,
                "role_ids" => [ 2 ]
            }
    }
    RestClient.post('http://10.131.11.115/'+'/projects/memberships.json', payload, api_headers)

    # recieve       404 Not Found (RestClient::NotFound)
  end

end