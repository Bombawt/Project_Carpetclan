require_relative( '../db/sql_runner' )


class Roll

  attr_accessor(:colour, :roll_width, :roll_length)
  attr_reader(:id, :carpet_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @carpet_id = options['carpet_id'].to_i
    @colour = options['colour']
    @roll_width = options['roll_width']
    @roll_length = options['roll_length']
  end

  def save()
    sql = "INSERT INTO rolls
    (
      carpet_id,
      colour,
      roll_width,
      roll_length
      )
      VALUES
      ($1, $2, $3, $4)
      RETURNING id"
      values = [@carpet_id, @colour, @roll_width, @roll_length]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE rolls SET
    (
      carpet_id,
      colour,
      roll_width,
      roll_length
      )
      =
      ($1, $2, $3, $4)
      WHERE id = $5
    "
    values = [@carpet_id, @colour, @roll_width, @roll_length, @id]
    SqlRunner.run(sql, values)
  end

  def Roll.all
    sql = "SELECT * FROM rolls"
    results = SqlRunner.run(sql)
    return results.map{|stock| Roll.new(stock)}
  end

  def Roll.delete_all()
    sql = "DELETE FROM rolls"
    SqlRunner.run(sql)
  end

  def destroy(id)
    sql = "DELETE FROM rolls WHERE id =$1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Roll.find(id)
    sql = "SELECT * FROM rolls WHERE id = $1"
    values = [id]
    roll_hash = SqlRunner.run(sql, values).first()
    return nil if roll_hash == nil
    return Roll.new(roll_hash)
  end

  def carpet()
    sql = "SELECT * FROM carpets WHERE id = $1"
    values = [@carpet_id]
    results = SqlRunner.run(sql, values)
    return Carpet.new(results.first)
  end

  








end
