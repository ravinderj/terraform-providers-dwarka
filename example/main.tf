resource "dwarka_building" "main" {
  name        = "terraform"
  description = "created by terraform"
  lat         = 13.0827
  lan         = 80.2707
}

resource "dwarka_floor" "main" {
  building_id = dwarka_building.main.id
  name        = "terrace"
  level       = 1
  description = "created by terraform"
}

resource "dwarka_floor" "secondfloor" {
  building_id = dwarka_building.main.id
  name        = "secondfloor"
  level       = 2
  description = "created by terraform"
}

resource "dwarka_floor" "thirdfloor" {
  building_id = dwarka_building.main.id
  name        = "thirdfloor"
  level       = 3
  description = "created by terraform"
}

resource "dwarka_floor" "fourthfloor" {
  building_id = dwarka_building.main.id
  name        = "fourthfloor"
  level       = 4
  description = "created by terraform"
}
