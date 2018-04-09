# README

# sports_api

* This API was created using the CBS Sports Fantasy API for three different sports: football, basketball, and baseball

* After cloning this repository, migrate and seed the database to access the following endpoints:

  \*individual players
  for example: by visiting the #{localhosturl}/players/25, you can see the individual player object for the 25th player

  \*all players of a specific sport
  for example: by visiting the #{localhosturl}/sports/2, you can see all the players associated with the second sport, basketball

  * Of note: some players' ages were not included in the original API, and therefore cannot be included here. For these players, average_position_age_diff cannot be calculated either and will be represented by null
