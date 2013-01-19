class MyApp < Sinatra::Base
  before do
    @flash = session.delete(:flash)
  end

  get '/' do
    @wineries = Winery.all
    haml :index
  end
  
  post '/update/:id/:status' do
    winery = Winery.get(params[:id])
    winery.visiting = params[:status]
    winery.save
    haml :_visit, :layout => false, :locals => {:winery => winery}
  end
  
  get '/get_info/:id' do
    winery = Winery.get(params[:id])
    doc = Nokogiri::HTML(open("http://www.sonomawine.com/#{winery.detail_url}"))
    doc.css('.scvProfileLeft table')[1].to_s
  end
end
