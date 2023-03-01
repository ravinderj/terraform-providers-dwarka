resource "dwarka_building" "flat" {
  name        = var.building_name
  description = "from terraform"
  lat         = 13.0827
  lan         = 80.2707
}

resource "dwarka_floor" "flat_ground" {
  building_id = dwarka_building.flat.id
  name        = "ground floor"
  description = "from terraform"
  level       = var.floor_level
}

resource "dwarka_room" "flat_bedroom" {
  building_id = dwarka_building.flat.id
  floor_id    = dwarka_floor.flat_ground.id
  name        = "bedroom"
  description = "from terraform"
  direction   = "south"
}

resource "dwarka_room" "flat_hall" {
  building_id = dwarka_building.flat.id
  floor_id    = dwarka_floor.flat_ground.id
  name        = "common room"
  description = "from terraform"
  direction   = "south"
}

resource "dwarka_room" "flat_kitchen" {
  building_id = dwarka_building.flat.id
  floor_id    = dwarka_floor.flat_ground.id
  name        = "kitchen"
  description = "from terraform"
  direction   = "south"
}

output "building_id" {
  value = dwarka_building.flat.id
}

output "bedroom_id" {
  value = dwarka_floor.flat_ground.id
}
