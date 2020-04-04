require_relative( '../db/sql_runner' )

class Carpet

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
    sql = "INSERT INTO carpets
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

  def update()
    sql = "UPDATE carpets SET
    (
      range,
      supplier_id,
      type,
      pile,
      colour,
      buying_cost,
      selling_price
      )
      =
      ($1, $2, $3, $4, $5, $6, $7)
      WHERE id= $8
    "
    values = [@range, @supplier_id, @type, @pile, @colour, @buying_cost, @selling_price, @id]
    SqlRunner.run(sql, values)
  end

  def Carpet.all
    sql = "SELECT * FROM carpets"
    results = SqlRunner.run(sql)
    return results.map{|stock| Carpet.new(stock)}
  end

  def Carpet.delete_all()
    sql = "DELETE FROM carpets"
    SqlRunner.run(sql)
  end

  def destroy(id)
    sql = "DELETE FROM carpets WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Carpet.find(id)
    sql = "SELECT * FROM carpets WHERE id = $1"
    values = [id]
    carpet_hash =SqlRunner.run(sql, values).first()
    return nil if carpet_hash == nil
    return Carpet.new(carpet_hash)
  end

  def supplier()
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [@supplier_id]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end







end
