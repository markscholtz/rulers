require_relative "test_helper"

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    test_app = TestApp::Application.new
    test_app.application_root = File.join(File.dirname(__FILE__), "test_app")
    test_app
  end

  def test_root_request_returns_public_index_by_default
    get "/"

    assert last_response.ok?, "Response not ok."

    body = last_response.body
    assert body["Welcome to Rulers"], 'Index not loaded.'
  end

  def test_another_path_request
    get "/test/index"
    assert last_response.ok?, "Response not ok."

    body = last_response.body
    assert body["Hello Mark"], 'Test index not loaded.'
  end
end
