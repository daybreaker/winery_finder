require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'logger'
require 'open-uri'
require 'nokogiri'
require 'haml'
require_relative 'routes/init'
require_relative 'helpers/init'
require_relative 'models/init'

#sass --watch assets/application.scss:public/css/main.css

class MyApp < Sinatra::Base
  enable :method_override
  enable :sessions
  set :session_secret, 'super secret'

  configure do
    set :app_file, __FILE__
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :qa do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false #false will show nicer error page
    set :show_exceptions, false #true will ignore raise_errors and display backtrace in browser
  end
end
