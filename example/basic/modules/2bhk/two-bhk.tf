module "bhk1" {
  source        = "../1bhk"
  building_name = var.building_name
  floor_level   = 1
}

resource "dwarka_room" "flat_bedroom-2" {
  building_id = module.bhk1.building_id
  floor_id    = module.bhk1.bedroom_id
  name        = "bedroom 2"
  description = "from terraform"
  direction   = "south"
}
