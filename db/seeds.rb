require_relative( "../models/supplier.rb" )
require_relative( "../models/carpet.rb")
require_relative( "../models/roll.rb")
# require_relative( "../models/cut.rb")
require("pry-byebug")

# Cut.delete_all
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
  "range" => "Soft Noble",
  "supplier_id" => supplier1.id,
  "type" => "Polypropolene",
  "pile" => "Saxony",
  "colour" => "Grey Mare 900",
  "buying_cost" => 5.95,
  "selling_price" => 12.99
  })

carpet1.save()

carpet2 = Carpet.new({
  "range" => "Soft Noble",
  "supplier_id" => supplier1.id,
  "type" => "Polypropolene",
  "pile" => "Saxony",
  "colour" => "Snowdrop 610",
  "buying_cost" => 5.95,
  "selling_price" => 12.99
  })

carpet2.save()

carpet3 = Carpet.new({
  "range" => "Cottage Berber",
  "supplier_id" => supplier2.id,
  "type" => "100% Wool",
  "pile" => "Twist",
  "colour" => "Gunmetal",
  "buying_cost" => 8.95,
  "selling_price" => 18.99
  })

carpet3.save()

carpet4 = Carpet.new({
  "range" => "Elegance",
  "supplier_id" => supplier3.id,
  "type" => "Polypropolene",
  "pile" => "Twist",
  "colour" => "Pewter",
  "buying_cost" => 7.21,
  "selling_price" => 15.99
  })

carpet4.save()

roll1 = Roll.new({
  "carpet_id" => carpet1.id,
  "roll_width" => 4,
  "roll_length" => 30
  })

roll1.save()
#
# cut1 = Cut.new({
#   "carpet_id" => carpet1.id,
#   "cut_width" => 4,
#   "cut_length" => 27.65
#   })
#
# cut1.save()

















binding.pry
nil
