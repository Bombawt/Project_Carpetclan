require_relative( '../db/sql_runner' )

class RollStock

  attr_accessor(:full_rolls, :cut_rolls)
  attr_reader(:id, :carpet_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @carpet_id = options['carpet_id'].to_i
    @full_rolls = options['full_rolls']
    @cut_rolls = options['cut_rolls']
  end











end
