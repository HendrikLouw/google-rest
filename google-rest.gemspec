Gem::Specification.new do |s|
  s.name = %q{google-rest}
  s.version = "0.0.2"
  s.date = %q{2008-11-05}
  s.summary = %q{ A simple Ruby wrapper around the Google REST API from http://code.google.com/apis/ajaxsearch/documentation/reference.html#_intro_fonje}
  s.email = ["hflouw@gmail.com"]
  s.homepage = %q{http://daimpi.co.za}
  s.rubyforge_project = %q{google-rest}
  s.description = %q{It can search google and gets JSON results back in a (hopefully) ruby way}
  s.has_rdoc = true
  s.post_install_message = %q{PostInstall.txt}
  s.authors = ["Hendrik F. Louw"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/google-rest.rb", "lib/google-rest/google_result.rb", "lib/google-rest/google_result_set.rb", "lib/google-rest/google_search.rb", "script/console", "script/destroy", "script/generate", "test/test_google-rest.rb", "test/test_helper.rb"]
  s.test_files = ["test/test_helper.rb", "test/test_google-rest.rb"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
end