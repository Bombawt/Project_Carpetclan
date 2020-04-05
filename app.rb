require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/carpets_controller')
require_relative('controllers/rolls_controller')
require_relative('controllers/suppliers_controller')

get '/' do
  erb(:index)
end
