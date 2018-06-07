require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'


class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'page working!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must enter a valid URL" unless Bookmark.create(url: params['url'], title: params['title'])
    p params
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id/delete' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    redirect '/'
  end

  run! if app_file ==$0
end
