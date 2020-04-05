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
