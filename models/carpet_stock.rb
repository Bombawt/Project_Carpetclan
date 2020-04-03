require_relative( '../db/sql_runner' )

class CarpetStock

  attr_accessor( :range, :type, :pile, :colour, :buying_cost, :selling_price )
  attr_reader(:id, :supplier_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @range = options['range']
    @supplier_id = options['supplier_id'].to_i
    @type = options['type']
    @pile = options['pile']
    @colour = options['colour']
    @buying_cost = options['buying_cost']
    @selling_price = options['selling_price']
  end

  def save()
    sql = "INSERT INTO carpet_stock
    (
      range,
      supplier_id,
      type,
      pile,
      colour,
      buying_cost,
      selling_price
      )
      VALUES
      ($1, $2, $3, $4, $5, $6, $7)
      RETURNING id"
      values = [@range, @supplier_id, @type, @pile, @colour, @buying_cost, @selling_price]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def CarpetStock.all
    sql = "SELECT * FROM carpet_stock"
    results = SqlRunner.run(sql)
    return results.map{|stock| CarpetStock.new(stock)}
  end

  def delete_all()
    sql = "DELETE FROM carpet_stock"
    SqlRunner.run(sql)
  end

  def destroy(id)
    sql = "DELETE FROM carpet_stock WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def supplier()
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [@supplier_id]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end







end
