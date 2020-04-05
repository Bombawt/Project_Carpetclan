require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/carpet.rb')
require_relative('../models/supplier.rb')
require_relative('../models/roll.rb')
also_reload( '../models/*' )

get '/carpets' do
  @carpets = Carpet.all()
  @rolls = Roll.all()
  erb ( :"carpets/index" )
end
#
# get '/carpets/new' do
#   WAIT


# get '/carpets/:id' do
#   @carpets = Carpets.find(params['id'].to_i)
#   erb (:"carpets/show")
# end
