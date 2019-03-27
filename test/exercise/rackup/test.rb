require './test/test_helper'
require 'test/unit'
require 'rack/test'
require_relative './inatra'
require_relative './my_app'

class RackTest < Test::Unit::TestCase
  def setup
    @browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
  end

  def test_get_request
    @browser.get '/hello'
    assert @browser.last_response.ok?
    assert_equal 'Hello World', @browser.last_response.body
  end

  def test_post_request
    @browser.post '/another_route'
    assert @browser.last_response.ok?
    assert_equal 'Another Route', @browser.last_response.body
  end
end
