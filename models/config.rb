class MyApp < Sinatra::Base
  ## CONFIGURATION
  configure :development do
    DataMapper.setup(:default, {
      :adapter  => 'mysql',
      :host     => 'localhost',
      :username => 'root' ,
      :password => '',
      :database => 'winery_finder'})  

    DataMapper::Logger.new(STDOUT, :debug)
  end

  configure :production do
    DataMapper.setup(:default, {
      :adapter  => 'mysql',
      :host     => 'localhost',
      :username => 'daybreaker' ,
      :password => 'groovy!2',
      :database => 'winery_finder'})  
  end
end
