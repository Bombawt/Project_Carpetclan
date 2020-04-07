require_relative( "../models/supplier.rb" )
require_relative( "../models/carpet.rb")
require_relative( "../models/roll.rb")
require("pry-byebug")

Roll.delete_all
Carpet.delete_all
Supplier.delete_all

supplier1 = Supplier.new({
  "name" => "Headlam",
  "rep" => "Lesley Phillips",
  "rep_contact" => "07664 345288"
  })

supplier1.save()

supplier2 = Supplier.new({
  "name" => "Lifestyle Floors",
  "rep" => "Norman McTellers",
  "rep_contact" => "07732 128886"
  })

supplier2.save()

supplier3 = Supplier.new({
  "name" => "Flanagan Flooring",
  "rep" => "Alistair Anderson",
  "rep_contact" => "07921 562413"
  })

supplier3.save()


carpet1 = Carpet.new({
  "brand" => "Soft Noble",
  "supplier_id" => supplier1.id,
  "buying_cost" => 5.95
  })

carpet1.save()

carpet2 = Carpet.new({
  "brand" => "Jupiter",
  "supplier_id" => supplier1.id,
  "buying_cost" => 5.95,
  })

carpet2.save()

carpet3 = Carpet.new({
  "brand" => "Cottage Berber",
  "supplier_id" => supplier2.id,
  "buying_cost" => 8.95,
  })

carpet3.save()

carpet4 = Carpet.new({
  "brand" => "Elegance",
  "supplier_id" => supplier3.id,
  "buying_cost" => 7.21,
  })

carpet4.save()

roll1 = Roll.new({
  "carpet_id" => carpet1.id,
  "colour" => "Grey Mare",
  "roll_width" => 4,
  "roll_length" => 30

  })

roll1.save()

roll2 = Roll.new({
  "carpet_id" => carpet2.id,
  "colour" => "Galaxy",
  "roll_width" => 4,
  "roll_length" => 24.50
  })

roll2.save()

roll3 = Roll.new({
  "carpet_id" => carpet1.id,
  "colour" => "Snowdrop",
  "roll_width" => 5,
  "roll_length" => 14.35
  })

roll3.save()



















binding.pry
nil
