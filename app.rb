require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #dbase configuration

class App < Sinatra::Base
  set :sessions => true

  def initialize
    super
    @user_database = UserDatabase.new
  end

  register do
    def auth (type)
      condition do
        redirect "/login" unless send("is_#{type}?")
      end
    end
  end

  helpers do
    def is_user?
      @user != nil
    end
  end

  before do
    @user = User.get(session[:user_id])
  end

  get "/" do
    "Hello, anonymous."
    # erb :index, :layout => :layout
  end

  get "/protected", :auth => :user do
    "Hello, #{@user.name}."
  end

  post "/login" do
    session[:user_id] = User.authenticate(params).id
  end

  get "/logout" do
    session[:user_id] = nil
  end


# class Posting < ActiveRecord::Base
# end
#
# get '/' do
#   erb :index
# end
#
# post '/submit' do
#   @posting = Posting.new(params[:posting])
#   if @posting.save
#     redirect '/posting'
#   else
#     "Sorry, there was an error!"
#   end
#
#   get '/posting' do
#     @posting = Posting.all
#     erb :posting
#   end

# get '/posting' do
#   @posting = posting.all
#   erb :posting

  # get '/users' do
  #   @users = User.all
  #   erb :index
  # end
  #
  # get '/users' do
  #   @users = User.all
  #   erb :index
  # end
  #
  # get '/users/:id' do
  #   @user = User.find(params[:id])
  #   erb :show
  # end

# The first route it for "/", this gets all notes in descending created order, if this returns empty, then the user is redirected to "/new" otherwise the index view is loaded. The "/new" route just loads the new view, all this view contains is a form with a title and body field which posts to "/new". The post route for "/new" creates a new note from the form parameters, if this saves the user is redirected to the note, otherwise it just loads the new view. Finally the "/note/:id" route loads a specific note based on the id, then loads this in the note view.
# get "/" do
#   @notes = Note.order("created_at DESC")
#   redirect "/new" if @notes.empty?
#   erb :index
# end
#
# get "/new" do
#   erb :new
# end
#
# post "/new" do
#   @note = Note.new(params[:note])
#   if @note.save
#     redirect "note/#{@note.id}"
#   else
#     erb :new
#   end
# end
#
# get "/note/:id" do
#   @note = Note.find_by_id(params[:id])
#   erb :note
# end
end