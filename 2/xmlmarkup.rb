#!/usr/bin/env ruby
require 'rubygems'
require 'builder'
xml = Builder::XmlMarkup.new.message('type' => 'apology') do |b|
  b.content('Sorry, Web Services are closed.')
end
puts xml
# >> <message type="apology"><content>Sorry, Web Services are closed.</content></message>
