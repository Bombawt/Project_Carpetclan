require_relative( '../db/sql_runner' )

class Carpet

  attr_accessor( :brand, :buying_cost, :selling_price )
  attr_reader(:id, :supplier_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @brand = options['brand']
    @supplier_id = options['supplier_id'].to_i
    @buying_cost = options['buying_cost'].to_f
    @selling_price = markup
  end

  def save()
    sql = "INSERT INTO carpets
    (
      brand,
      supplier_id,
      buying_cost,
      selling_price
      )
      VALUES
      ($1, $2, $3, $4)
      RETURNING id"
      values = [@brand, @supplier_id, @buying_cost, @selling_price]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE carpets SET
    (
      brand,
      supplier_id,
      buying_cost,
      selling_price
      )
      =
      ($1, $2, $3, $4)
      WHERE id= $5
    "
    values = [@brand, @supplier_id, @buying_cost, @selling_price, @id]
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

  def carpets()
    sql = "SELECT * FROM carpets WHERE supplier_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|results_hash|Carpet.new(results_hash)}
  end

  def rolls()
    sql = 'SELECT * FROM rolls WHERE carpet_id =$1'
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|results_hash|Roll.new(results_hash)}
  end

  def markup()
    total = (@buying_cost * 1.2 * 1.75)
    return (total.ceil) - 0.01
  end

  def margin()
    total = @selling_price - @buying_cost
    return total.round(2)
  end

end
