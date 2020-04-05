require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/carpet.rb')
require_relative('../models/supplier.rb')
require_relative('../models/roll.rb')
also_reload( '../models/*' )

get '/carpets' do
  @carpets = Carpet.all()
  @rolls = Roll.all()
  erb (:"carpets/index")
end

get '/carpets/new' do
  @suppliers = Supplier.all()
  erb(:"carpets/new")
end

post '/carpets' do
  @new_carpet = Carpet.new(params)
  @new_carpet.save()
  redirect to ('/carpets')
end
