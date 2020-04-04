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

  def RollStock.delete_all()
    sql = "DELETE FROM roll_stock"
    SqlRunner.run(sql)
  end











end
