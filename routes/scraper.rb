class MyApp < Sinatra::Base
  before do
    @flash = session.delete(:flash)
  end
  
  get '/build_wineries' do
    ('A'..'Z').each do |letter|
      doc = Nokogiri::HTML(open("http://www.sonomawine.com/index.php?option=com_content&view=category&layout=blog&id=8&Itemid=17&letter=#{letter}"))
      @wineries = doc.css("table.alpha-list tr td")
      
      @wineries.each do |winery|
        text_content = winery.children.select{|x| x.class == Nokogiri::XML::Text }
        
        address = \
        if !text_content[2].nil? && !text_content[3].nil?
          text_content[2].text + "\n" + text_content[3].text
        else
          ""
        end
        
        db_winery = Winery.first_or_create({:name => winery.children.css('a').first.text},
          {
            :tours => text_content.first.nil? ? "" : text_content.first.text,
            :detail_url => winery.children.css('a').first.attributes['href'].value,
            :phone => !text_content[1].nil? && text_content[1].text.length == 12 ? text_content[1].text : "",
            :address => address
          }
        )
        
        db_winery.save
      end
    end
    haml :scrape_cwa
  end
end
