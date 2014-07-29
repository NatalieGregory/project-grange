# This file describes how the app will connect to the database in the production (Heroku) and development (local) environments.
# The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
# First we get the database URL and parse it, this can be a full database URL as shown, or an environment variable for hosting on platforms such as Heroku. The ActiveRecord connection is the established using the data from the database URL.
# db = URI.parse(ENV['postgres://user:pass@localhost/dbname'

configure :production, :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mytown_postings')

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end