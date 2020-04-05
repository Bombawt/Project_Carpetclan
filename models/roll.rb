require_relative( '../db/sql_runner' )


class Roll

  attr_accessor(:roll_width, :roll_length)
  attr_reader(:id, :carpet_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @carpet_id = options['carpet_id'].to_i
    @roll_width = options['roll_width']
    @roll_length = options['roll_length']
  end

  def save()
    sql = "INSERT INTO rolls
    (
      carpet_id,
      roll_width,
      roll_length
      )
      VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@carpet_id, @roll_width, @roll_length]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE rolls SET
    (
      carpet_id,
      roll_width,
      roll_length
      )
      =
      ($1, $2, $3)
      WHERE id = $4
    "
    values = [@carpet_id, @roll_width, @roll_length]
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
    return nil if roll == nil
    return Roll.new(roll_hash)
  end

  def carpet()
    sql = "SELECT * FROM carpets WHERE id = $1"
    values = [@carpet_id]
    results = SqlRunner.run(sql, values)
    return Carpet.new(results.first)
  end

  def cut_roll(new_cut)
    if new_cut < @roll_length
      return @roll_length -= new_cut
    end
      return "Not enough stock, please try another roll."
  end

  def full_roll()
    @roll_length == 30
  end








end
