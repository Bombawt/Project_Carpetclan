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
  "rep" => "Alistair Henderson",
  "rep_contact" => "07921 562413"
  })

supplier3.save()

supplier4 = Supplier.new({
  "name" => "Penthouse Carpets",
  "rep" => "Stephen Crawley",
  "rep_contact" => "07835 225671"
  })

supplier4.save()

supplier5 = Supplier.new({
  "name" => "Brockway",
  "rep" => "Stuart Sturgeon",
  "rep_contact" => "07888 123856"
  })

supplier5.save()


carpet1 = Carpet.new({
  "brand" => "Soft Noble",
  "supplier_id" => supplier1.id,
  "buying_cost" => 5.95
  })

carpet1.save()

carpet2 = Carpet.new({
  "brand" => "Jupiter",
  "supplier_id" => supplier1.id,
  "buying_cost" => 6.95,
  })

carpet2.save()

carpet3 = Carpet.new({
  "brand" => "Cottage Berber",
  "supplier_id" => supplier2.id,
  "buying_cost" => 8.95,
  })

carpet3.save()

carpet4 = Carpet.new({
  "brand" => "California Dreams",
  "supplier_id" => supplier2.id,
  "buying_cost" => 17.81,
  })

carpet4.save()

carpet5 = Carpet.new({
  "brand" => "Elegance",
  "supplier_id" => supplier3.id,
  "buying_cost" => 7.21,
  })

carpet5.save()

carpet6 = Carpet.new({
  "brand" => "Mayfield",
  "supplier_id" => supplier3.id,
  "buying_cost" => 3.21,
  })

carpet6.save()

carpet7 = Carpet.new({
  "brand" => "Shoreline",
  "supplier_id" => supplier4.id,
  "buying_cost" => 10.52,
  })

carpet7.save()

carpet8 = Carpet.new({
  "brand" => "Stateside",
  "supplier_id" => supplier4.id,
  "buying_cost" => 12.37,
  })

carpet8.save()

carpet9 = Carpet.new({
  "brand" => "Galloway",
  "supplier_id" => supplier5.id,
  "buying_cost" => 19.63,
  })

carpet9.save()

carpet10 = Carpet.new({
  "brand" => "Natural Tweed",
  "supplier_id" => supplier5.id,
  "buying_cost" => 17.44,
  })

carpet10.save()

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
  "carpet_id" => carpet3.id,
  "colour" => "Wheat",
  "roll_width" => 5,
  "roll_length" => 14.35
  })

roll3.save()

roll4 = Roll.new({
  "carpet_id" => carpet4.id,
  "colour" => "Blush",
  "roll_width" => 5,
  "roll_length" => 4.15
  })

roll4.save()

roll5 = Roll.new({
  "carpet_id" => carpet5.id,
  "colour" => "Pewter",
  "roll_width" => 4,
  "roll_length" => 30.00
  })

roll5.save()

roll6 = Roll.new({
  "carpet_id" => carpet6.id,
  "colour" => "Heather",
  "roll_width" => 5,
  "roll_length" => 22.70
  })

roll6.save()

roll7 = Roll.new({
  "carpet_id" => carpet7.id,
  "colour" => "Harbour",
  "roll_width" => 5,
  "roll_length" => 30.00
  })

roll7.save()

roll8 = Roll.new({
  "carpet_id" => carpet7.id,
  "colour" => "Castaway",
  "roll_width" => 5,
  "roll_length" => 14.80
  })

roll8.save()

roll9 = Roll.new({
  "carpet_id" => carpet7.id,
  "colour" => "Castaway",
  "roll_width" => 5,
  "roll_length" => 6.29
  })

roll9.save()

roll10 = Roll.new({
  "carpet_id" => carpet10.id,
  "colour" => "Harris",
  "roll_width" => 4,
  "roll_length" => 7.50
  })

roll10.save()















binding.pry
nil
