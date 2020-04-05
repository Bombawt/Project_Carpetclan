require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/supplier.rb')
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all()
  erb ( :"suppliers/index" )
end
