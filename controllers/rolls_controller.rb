require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/roll.rb')
require_relative('../models/carpet.rb')
also_reload( '../models/*' )

get '/rolls' do
  @rolls = Roll.all()
  erb ( :"rolls/index" )
end

get '/rolls/new' do
  @rolls = Roll.all()
  @carpets = Carpet.all()
  erb(:"rolls/new")
end

post '/rolls' do
  @new_roll = Roll.new(params)
  @new_roll.save()
  redirect to ('/rolls')
end

get '/rolls/:id/edit' do
  id = params['id'].to_i()
  @rolls = Roll.find(id)
  @carpets = Carpet.all()
  erb(:"rolls/edit")
end

post '/rolls/:id/destroy' do
  id = params['id'].to_i()
  roll = Roll.find(id)
  roll.destroy(id)
  erb(:"rolls/destroy")
end

post '/rolls/:id' do
  roll = Roll.new(params)
  roll.update()
  redirect('/rolls')
end
