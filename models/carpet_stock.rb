require_relative( '../db/sql_runner' )


class CarpetStock

attr_accessor( :range, :type, :pile, :colour, :buying_cost, :selling_price )
attr_reader(:id, :supplier_id, :four_metre_roll_stock, :five_metre_roll_stock)

def initialize(options)
  @id = options['id'].to_i if options['id']
  @range = options['range']
  @supplier = options['supplier_id'].to_i
  @type = options['type']
  @pile = options['pile']
  @colour = options['colour']
  @five_metre_roll_stock = options['five_metre_roll_stock'].to_i
  @four_metre_roll_stock = options['four_metre_roll_stock'].to_i
  @buying_cost = options['buying_cost']
  @selling_price = options['selling_price']
end




end
