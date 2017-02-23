require 'rubygems'
require 'bundler/setup'
ENV['RACK_ENV'] = 'test'
require_relative 'adventure'
require 'test/unit'
require 'rack/test'
require 'faker'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
)

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
    ipsum = Lipsum.find_by(name: "Cupcake").text
    assert_equal ipsum, last_response.body
  end

  def test_cheese_page
    get "/lorem/cheese"
    assert last_response.ok?
    ipsum = Lipsum.find_by(name: "Cheese").text
    assert_equal ipsum, last_response.body
  end

  def test_future_page
    get "/lorem/future"
    assert last_response.ok?
    ipsum = Lipsum.find_by(name: "Future").text
    assert_equal ipsum, last_response.body
  end

  def test_post
   post "/lorem/new", {name: "dog", text: "Woof Woof"}
   assert last_response.ok?
   lipsum = Lipsum.find_by(name: "dog").text
   assert_equal lipsum, "Woof Woof"
  end


end
