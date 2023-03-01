module "bhk1" {
  source        = "../1bhk"
  building_name = var.building_name
  floor_level   = var.floor_level
}

module "bhk2" {
  source        = "../2bhk"
  building_name = var.building_name
  floor_level   = var.floor_level
}

resource "dwarka_floor" "flat_floor_extra" {
  building_id = module.bhk1.building_id
  level    = 10
  name        = "extra floor"
  description = "from terraform"
}
