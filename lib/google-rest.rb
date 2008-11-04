$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'google-rest/google_search'
require 'google-rest/google_result'
require 'google-rest/google_result_set'
module GoogleRest
  VERSION = '0.0.2'
end
