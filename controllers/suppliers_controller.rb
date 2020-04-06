require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/supplier.rb')
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all()
  erb ( :"suppliers/index" )
end

get '/suppliers/new' do
  erb(:"suppliers/new")
end

post '/suppliers' do
  @new_supplier = Supplier.new(params)
  @new_supplier.save()
  redirect to ('/suppliers')
end

get '/suppliers/:id' do
  @suppliers = Supplier.find(params['id'].to_i)
  @carpets = Carpet.all()
  erb( :"suppliers/show" )
end


get '/suppliers/:id/edit' do
  id = params['id'].to_i()
  @suppliers = Supplier.find(id)
  erb(:"suppliers/edit")
end

post '/suppliers/:id/destroy' do
  id = params['id'].to_i()
  supplier = Supplier.find(id)
  supplier.destroy(id)
  erb(:"suppliers/destroy")
end

post '/suppliers/:id' do
  supplier = Supplier.new(params)
  supplier.update
  redirect('/suppliers/' + params['id'])
end
