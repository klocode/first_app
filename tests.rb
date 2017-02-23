require 'rubygems'
require 'bundler/setup'
ENV['RACK_ENV'] = 'test'

require_relative 'first_app'
require 'test/unit'
require 'rack/test'
require 'faker'

# ActiveRecord::Base.establish_connection(
#   adapter:  'sqlite3',
#   database: 'test.sqlite3'
# )

class FirstAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_the_index
    get '/'
    assert last_response.ok?
    assert_equal 'Greetings Earthling!', last_response.body
  end

  def test_names_page
    name = Faker::Name.first_name
    get "/#{name}"
    assert last_response.ok?
    assert_equal "Why hello there, #{name}!", last_response.body
  end

  def test_cupcake_page
    get "/lorem/cupcake"
    assert last_response.ok?
    assert_equal Cupcake.text, last_response.body

    get "/lorem/cupcake/2"
    assert last_response.ok?
    assert_equal Cupcake.text * 2, last_response.body
  end

  def test_cheese_page
    get "/lorem/cheese"
    assert last_response.ok?
    assert_equal Cheese.text, last_response.body

    get "lorem/cheese/3"
    assert last_response.ok?
    assert_equal Cheese.text * 3, last_response.body
  end

  def test_future_page
    get "/lorem/future"
    assert last_response.ok?
    assert_equal Future.text, last_response.body

    get "lorem/future/4"
    assert last_response.ok?
    assert_equal Future.text * 4, last_response.body
  end


end
