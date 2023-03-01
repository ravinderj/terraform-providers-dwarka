module "bhk1" {
  source = "./modules/1bhk"
  building_name = "gryffindor"
  floor_level = 1
}

module "bhk2" {
  source = "./modules/1bhk"
  building_name = "slytherin"
  floor_level = 1
}

module "a-2bhk" {
  source = "./modules/2bhk"
  building_name = "ravenclaw"
  floor_level = 1
}

module "apartment-1" {
  source = "./modules/apartment"
  building_name = "hufflepuff"
  floor_level = 1
}