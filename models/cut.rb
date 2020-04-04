require_relative( '../db/sql_runner' )

class Cut

  attr_accessor(:width, :cut_roll)
  attr_reader(:id, :carpet_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @carpet_id = options['carpet_id'].to_i
    @width = options['width']
    @cut_roll = options['cut_roll']
  end

  def save()
    sql = "INSERT INTO cuts
    (
      carpet_id,
      width,
      cut_roll
      )
      VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@carpet_id, @width, @cut_roll]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE cuts SET
    (
      carpet_id,
      width,
      cut_roll
      )
      =
      ($1, $2, $3)
      WHERE id = $4
    "
    values = [@carpet_id, @width, @cut_roll]
    SqlRunner.run(sql, values)
  end

  def Cut.all
    sql = "SELECT * FROM cuts"
    results = SqlRunner.run(sql)
    return results.map{|stock| Cut.new(stock)}
  end

  def Cut.delete_all()
    sql = "DELETE FROM cuts"
    SqlRunner.run(sql)
  end

  def destroy(id)
    sql = "DELETE FROM cuts WHERE id =$1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Cut.find(id)
    sql = "SELECT * FROM cuts WHERE id = $1"
    values = [id]
    cut_hash = SqlRunner.run(sql, values).first()
    return nil if cut == nil
    return Cut.new(cut_hash)
  end

  def carpet()
    sql = "SELECT * FROM carpets WHERE id = $1"
    values = [@carpet_id]
    results = SqlRunner.run(sql, values)
    return Carpet.new(results.first)
  end




end