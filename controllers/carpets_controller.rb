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

get '/carpets/:id' do
  @carpets = Carpet.find(params['id'].to_i)
  @rolls = Roll.all()
  @suppliers = Supplier.all()
  erb(:"carpets/show")
end

get '/carpets/:id/edit' do
  id = params['id'].to_i()
  @carpets = Carpet.find(id)
  @suppliers = Supplier.all()
  erb(:"carpets/edit")
end

post '/carpets/:id' do
  carpet = Carpet.new(params)
  carpet.update
  redirect('/carpets/' + params['id'])
end
