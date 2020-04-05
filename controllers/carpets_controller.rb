require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/carpet.rb')
require_relative('../models/supplier.rb')
also_reload( '../models/*' )

get '/carpets' do
  @carpets = Carpet.all()
  erb ( :"carpets/index" )
end

get '/carpets/:name' do
  @carpets = Carpets.find(params[:name])
  erb (:"carpets/show")
end
