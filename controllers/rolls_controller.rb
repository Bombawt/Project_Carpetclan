require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/roll.rb')
require_relative('../models/carpet.rb')
also_reload( '../models/*' )

get '/rolls' do
  @rolls = Roll.all()
  erb ( :"rolls/index" )
end
