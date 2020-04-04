require_relative( '../db/sql_runner' )

class Supplier

  attr_accessor( :name, :rep, :rep_contact)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @rep = options['rep']
    @rep_contact = options['rep_contact']
  end

  def save()
    sql = "INSERT INTO suppliers
    (
      name,
      rep,
      rep_contact
      )
      VALUES
      ($1, $2, $3)
      RETURNING id"
      values = [@name, @rep, @rep_contact]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE suppliers SET
    (
      name,
      rep,
      rep_contact
      )
      =
      ($1, $2, $3)
      WHERE id= $4
    "
    values = [@name, @rep, @rep_contact, @id]
    SqlRunner.run(sql, values)
  end

  def Supplier.all
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run(sql)
    return results.map{|supplier| Supplier.new(supplier)}
  end

  def Supplier.delete_all()
    sql = "DELETE FROM suppliers"
    SqlRunner.run(sql)
  end

  def destroy(id)
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Supplier.find(id)
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [id]
    supplier_hash =SqlRunner.run(sql, values).first()
    return nil if supplier_hash == nil
    return Supplier.new(supplier_hash)
  end

  def carpets()
    sql = "SELECT * FROM carpet_stock WHERE supplier_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|results_hash|CarpetStock.new(results_hash)}
  end


















end
