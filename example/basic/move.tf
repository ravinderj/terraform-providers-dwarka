#For bhk1
moved {
  from = dwarka_building.gryffindor
  to = module.bhk1.dwarka_building.flat
}
moved {
  from = dwarka_floor.gryffindor_ground
  to = module.bhk1.dwarka_floor.flat_ground
}
moved {
  from = dwarka_room.gryffindor_hall
  to = module.bhk1.dwarka_room.flat_hall
}

#For bhk2
moved {
  from = dwarka_building.slytherin
  to = module.bhk2.dwarka_building.flat
}
moved {
  from = dwarka_floor.slytherin_ground
  to = module.bhk2.dwarka_floor.flat_ground
}
moved {
  from = dwarka_room.slytherin_hall
  to = module.bhk2.dwarka_room.flat_hall
}

#Create bhk2 from bhk1
moved {
  from = module.a-2bhk.dwarka_building.flat
  to   = module.a-2bhk.module.bhk1.dwarka_building.flat
}

moved {
  from = module.a-2bhk.dwarka_floor.flat_ground
  to   = module.a-2bhk.module.bhk1.dwarka_floor.flat_ground
}

moved {
  from = module.a-2bhk.dwarka_room.flat_bedroom-1
  to   = module.a-2bhk.module.bhk1.dwarka_room.flat_bedroom

}

moved {
  from = module.a-2bhk.dwarka_room.flat_hall
  to   = module.a-2bhk.module.bhk1.dwarka_room.flat_hall
}

moved {
  from = module.a-2bhk.dwarka_room.flat_kitchen
  to   = module.a-2bhk.module.bhk1.dwarka_room.flat_kitchen
}