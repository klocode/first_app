require 'sinatra'
require 'active_record'
require 'sqlite3'
require_relative 'lipsum'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
)


get "/" do
  "Greetings Earthling!"
end

get "/:name" do
  if params[:name] == 'lorem'
    Lipsum.pluck(:name).collect
  else
    "Why hello there, #{params[:name].capitalize}!"
  end
end

get "/lorem/:lipsum/?:num?" do
  if %w(cheese cupcake future).include? params[:lipsum]
    # Object.const_get(params[:lipsum].capitalize).call(params[:num])
    num = params[:num].to_i == 0 ? 1 : params[:num].to_i
    Lipsum.find_by(name: params[:lipsum].capitalize).body * num
  end
end

post "/lorem/new/?:num?" do
  Lipsum.create!(name: params[:name], body: params[:body])
end

#error message doesnt work as intended
# get "/not_found" do
#   status 404
#   "Can't find what you are looking for"
#  end
