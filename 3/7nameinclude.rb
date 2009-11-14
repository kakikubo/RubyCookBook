# require 'rexml/document'
# REXML::Document.new(xml)

require 'rexml/document'
include REXML # REXML::documentとかかなくてもよくなる
Document.new

require 'rexml/parsers/pullparser'
# REXML::Parsers::PullParser.new("Some XML")
# 以下のように書き換えられる
include REXML::Parsers
PullParser.new("Some XML")
