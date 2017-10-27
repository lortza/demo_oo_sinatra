require 'sinatra'
require 'sinatra/reloader' if development?
require 'erb'
require 'json'
require 'pry'
require './models/board'

get '/checkers' do
  @board = Board.new( session[:board_arr] )
  erb :checkers
end

post '/checkers/place_piece' do

  # Re-instantiate the board
  @board = Board.new( session[:board_arr] )

  # Try to place the piece on the board
  if @board.place_piece( params[:name_from_form] )
    # "Save" our board back to the session since
    # it has been modified
    session[:board_arr] = @board.board_arr.to_json

  else

    # Set an error variable we can render with the view
    @error = "You can't put a piece there, try again!"

  end

  # Render our template as normal
  erb :checkers
end