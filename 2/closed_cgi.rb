#! /usr/bin/env ruby
# closed_cgi.rb
require 'cgi'
c = CGI.new("html4")
c.out do 
  c.html do 
    c.h1 { 'Sorry, the web is closed.'}
  end
end
# >> Content-Type: text/html
# >> Content-Length: 137
# >> 
# >> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"><HTML><H1>Sorry, the web is closed.</H1></HTML>
