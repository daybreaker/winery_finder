class Winery
    include DataMapper::Resource
    property :id, Serial
    property :name, String
    property :description, Text
    property :created_at, DateTime
    property :address, String
    property :phone, String
    property :detail_url, String
    property :tours, String
    property :url, String
    property :tasting, Text
    property :tours, String
 	  property :amenities, Text
 	  property :price_range, String
 	  property :visiting, Boolean, :default  => false

end
