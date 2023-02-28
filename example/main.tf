resource "dwarka_building" "gryffindor" {
  name        = "gryffindor"
  description = "from terraform"
  lat         = 13.0827
  lan         = 80.2707
}

resource "dwarka_floor" "gryffindor_ground" {
  building_id = dwarka_building.gryffindor.id
  name        = "ground_floor" // fix it in case of having space in the name "ground floor"
  description = "from terraform"
  level       = 1
}

resource "dwarka_room" "gryffindor_bedroom" {
  building_id = dwarka_building.gryffindor.id
  floor_id    = dwarka_floor.gryffindor_ground.id
  name        = "bedroom"
  description = "from terraform"
  direction   = "south"
}

resource "dwarka_room" "gryffindor_hall" {
  building_id = dwarka_building.gryffindor.id
  floor_id    = dwarka_floor.gryffindor_ground.id
  name        = "common_hall"
  description = "from terraform"
  direction   = "south"
}

resource "dwarka_room" "kitchen" {
  building_id = dwarka_building.gryffindor.id
  floor_id    = dwarka_floor.gryffindor_ground.id
  name        = "kitchen"
  description = "from terraform"
  direction   = "south"
}


resource "dwarka_building" "slytherin" {
  name        = "slytherin"
  description = "from terraform"
  lat         = 13.0827
  lan         = 80.2707
}

resource "dwarka_floor" "slytherin_ground" {
  building_id = dwarka_building.slytherin.id
  name        = "ground_floor"
  description = "from terraform"
  level       = 1
}

resource "dwarka_room" "slytherin_bedroom" {
  building_id = dwarka_building.slytherin.id
  floor_id    = dwarka_floor.slytherin_ground.id
  name        = "bedroom"
  description = "from terraform"
  direction   = "south"
}

resource "dwarka_room" "slytherin_hall" {
  building_id = dwarka_building.slytherin.id
  floor_id    = dwarka_floor.slytherin_ground.id
  name        = "common_hall"
  description = "from terraform"
  direction   = "south"
}

resource "dwarka_room" "slytherin_kitchen" {
  building_id = dwarka_building.slytherin.id
  floor_id    = dwarka_floor.slytherin_ground.id
  name        = "kitchen"
  description = "from terraform"
  direction   = "south"
}
