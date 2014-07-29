# config.ru file helps Heroku run the app, Heroku will consider a Sinatra app to be the same as any other Rack-based ruby app and deploy it by following the instructions in config.ru.
#

require './app'
run Sinatra::Application