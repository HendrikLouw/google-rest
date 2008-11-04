require 'rubygems'
require 'json'
require 'net/http'

# Simple class for wrapping the google REST API as given on
# http://code.google.com/apis/ajaxsearch/documentation/reference.html#_intro_fonje
# into a more Ruby-ish library
# Please read previous links but just for a quick view of what this little baby 
# can do I've copied the main types of searches for you
# Web Search  	http://ajax.googleapis.com/ajax/services/search/web
# Local Search 	http://ajax.googleapis.com/ajax/services/search/local
# Video Search 	http://ajax.googleapis.com/ajax/services/search/video
# Blog Search 	http://ajax.googleapis.com/ajax/services/search/blogs
# News Search 	http://ajax.googleapis.com/ajax/services/search/news
# Book Search 	http://ajax.googleapis.com/ajax/services/search/books
# Image Search 	http://ajax.googleapis.com/ajax/services/search/images
# Patent Search http://ajax.googleapis.com/ajax/services/search/patent


class GoogleSearch
  BASE_URL = "http://ajax.googleapis.com/ajax/services/search"
  attr_accessor :cached_result
  attr_accessor :cached_response
   
  # All you need to do is specify a :type => 'web' or :type => 'local' or whatever
  # type of search you want to do. 
  # And you also need to pass a query through :q => "Awesomeness".
  # Any other optional parameters can be specified with a hash key value pair
  # in the method call of search ie
  # 
  # search(:type => 'web', :q => 'somequery', :rsz => 'big')
  # this would return a web search with the query 'somequery' and return a big resultset
  def search(options = {})
    # Do a reverse_merge!, but since ruby doesn't have it built in do it like this
    # if I use it again I'll move reverse_merge into its own little extension library
    defaults = {:v => "1.0", :type => "web"}
    options.replace(defaults.merge(options))
    
    url = "#{BASE_URL}/#{options[:type]}?q=#{URI.encode(options[:q])}"
    
    options.delete(:type)
    options.delete(:q)
    
    options.each do |key, value|    
      url += "&#{key.to_s}=#{URI.encode(value.to_s)}"
    end
    url = URI.parse(url)
    
    @cached_response = Net::HTTP.get_response url
    @cached_result = JSON.parse(@cached_response.body)
    if @cached_result['responseStatus'] == 200
      return @cached_result['responseData']['results']
    else
      raise @cached_result['responseDetails']
    end
  end
end
