require 'pry'
require 'httparty'


require_relative '../lib/modules/trivia.rb'
require_relative '../lib/api.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/datenighttrivia.rb'

TRIVIA::CLI.new

