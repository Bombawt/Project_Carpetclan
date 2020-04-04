require_relative( '../db/sql_runner' )

class RollStock

  attr_accessor(:width, :full_rolls)
  attr_reader(:id, :carpet_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @carpet_id = options['carpet_id'].to_i
    @width = options['width']
    @full_rolls = options['full_rolls']
  end

  def save()
    sql = "INSERT INTO roll_stock
    (
      carpet_id,
      width,
      full_rolls
      )
      VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@carpet_id, @width, @full_rolls]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE roll_stock SET
    (
      carpet_id,
      width,
      full_rolls
      )
      =
      ($1, $2, $3)
      WHERE id = $4
    "
    values = [@carpet_id, @width, @full_rolls]
    SqlRunner.run(sql, values)
  end

  def RollStock.all
    sql = "SELECT * FROM roll_stock"
    results = SqlRunner.run(sql)
    return results.map{|stock| RollStock.new(stock)}
  end

  def RollStock.delete_all()
    sql = "DELETE FROM roll_stock"
    SqlRunner.run(sql)
  end

  def destroy(id)
    sql = "DELETE FROM roll_stock WHERE id =$1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def RollStock.find(id)
    sql = "SELECT * FROM roll_stock WHERE id = $1"
    values = [id]
    roll_stock_hash = SqlRunner.run(sql, values).first()
    return nil if roll_stock_hash == nil
    return RollStock.new(roll_stock_hash)
  end

  def carpet()
    sql = "SELECT * FROM carpet_stock WHERE id = $1"
    values = [@carpet_id]
    results = SqlRunner.run(sql, values)
    return CarpetStock.new(results.first)
  end












end
