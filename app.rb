require 'sinatra'
require 'sinatra/reloader' if development?
require 'erb'
require 'json'
require 'pry'
require './models/name_saver'

# enable sessions or you're gonna have a bad time
enable :sessions

get '/' do
  @name_saver = NameSaver.new( session[:names] )
  erb :index
end

post '/add_name' do

  # Re-instantiate the name_saver
  @name_saver = NameSaver.new( session[:names] )

  # Try to add a name to the name_saver
  if @name_saver.add_name( params[:name_from_form] )
    # "Save" our name_saver back to the session since it has been modified
    session[:names] = @name_saver.names.to_json
  else

    # Set an error variable we can render with the view
    @error = "You can't add a name there, try again!"

  end

  # Render our template as normal
  erb :index
end