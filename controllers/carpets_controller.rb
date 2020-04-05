require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/carpet.rb')
require_relative('../models/supplier.rb')
also_reload( '../models/*' )
