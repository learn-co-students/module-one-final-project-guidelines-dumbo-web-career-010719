require_relative './game_methods.rb'


require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
require_all 'lib'

require_relative '../bin/app/models/lover.rb'
require_relative '../bin/app/models/dates.rb'
require_relative '../bin/app/models/user.rb'
