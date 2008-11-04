class GoogleResult 
  
  @@attributes = [:g_search_result_class, :unescaped_url, :url, 
    :visible_url, :cache_url, :title, :title_no_formatting, :content]
  
  @@attributes.each do |attr|
    attr_reader attr
  end

  #   {
  #   "GsearchResultClass": "GwebSearch",
  #   "unescapedUrl": "http://en.wikipedia.org/wiki/Paris_Hilton",
  #   "url": "http://en.wikipedia.org/wiki/Paris_Hilton",
  #   "visibleUrl": "en.wikipedia.org",
  #   "cacheUrl": "http://www.google.com/search?q\u003dcache:TwrPfhd22hYJ:en.wikipedia.org",
  #   "title": "\u003cb\u003eParis Hilton\u003c/b\u003e - Wikipedia, the free encyclopedia",
  #   "titleNoFormatting": "Paris Hilton - Wikipedia, the free encyclopedia",
  #   "content": "In 2006, she released her debut album \u003cb\u003eParis\u003c/b\u003e..."
  #  }
  def initialize(result)
    result.each do |key, value|
      string = "#{underscore(key.to_s)}='#{value}'"
      eval "@#{string}"
    end
  end
  
  
  def underscore(camel_cased_word)
    camel_cased_word.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
end