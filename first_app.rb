require 'sinatra'
require_relative 'cheese'
require_relative 'cupcake'
require_relative 'future'


get "/" do
  "Hello World!"
end

get "/:name" do
  "Why hello there, #{params[:name].capitalize}!"
end

get "/lorem/:lipsum/?:num?" do
  if %w(cheese cupcake future).include? params[:lipsum]
    Object.const_get(params[:lipsum].capitalize).call(params[:num])
  else
   redirect "/not_found"
  end
end

get "/not_found" do
  status 404
  "Can't find what you are looking for"
 end
