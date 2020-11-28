# Session 8
## Reto 1 Starbucks - Alternativa

[{$addFields: { 
  myLat: 20.641859,
  myLong: -103.440948
}}, {$addFields: {
  subLat: {$abs:{ $subtract: ["$Latitude", "$myLat"]}},
  subLong: {$abs: { $subtract: ["$Longitude", "$myLong"]}},
}}, {$sort: {
  subLat: 1,
  subLong: 1
}}, {$project: {
  _id: 0,
  'Store Name': 1
}}, {$limit: 1}]