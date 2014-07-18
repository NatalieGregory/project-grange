require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/posting'

get '/' do
  erb :index
end

post '/submit' do
  @posting = posting.new(params[:posting])
  if @posting.save
    redirect '/posting'
  else
    "Sorry, there was an error!"
  end
end

get '/posting' do
  @posting = posting.all
  erb :posting
end