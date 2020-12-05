# Ej1
[{$match: {
  property_type: "House",
  bedrooms: { $gte: 1 }
}}, {$addFields: {
  costoRecamara: { 
    $divide: [ "$price", "$bedrooms" ]
  }
}}, {$group: {
  _id: null,
  recamaras: {
    $sum: 1
  },
  total: {
    $sum: "$costoRecamara"
  }
}}, {$addFields: {
  costoPromedio: {
    $divide: [ "$total", "$recamaras"]
  }
}}, {$project: {
  costoRedondeado: { 
    $round: [ "$costoPromedio", 2] 
  }
}}]

# Reto 1
[{$match: {
  property_type: 'House',
  bedrooms: {
    $gte: 1
  }
}}, {$addFields: {
  costoRecamara: {
    $divide: [
      '$price',
      '$bedrooms'
    ]
  }
}}, {$group: {
  _id: "$address.country",
  recamaras: {
    $sum: 1
  },
  total: {
    $sum: '$costoRecamara'
  }
}}, {$addFields: {
  costoPromedio: {
    $divide: [
      '$total',
      '$recamaras'
    ]
  }
}}, {$project: {
  costoRedondeado: {
    $round: [
      '$costoPromedio',
      2
    ]
  }
}}, {$sort: {
  _id: 1
}}]

# Ej2
[{$lookup: {
  from: 'movies',
  localField: 'movie_id',
  foreignField: '_id',
  as: 'peliculaArr'
}}, {$addFields: {
  peliculaObj: {
    $arrayElemAt: [ "$peliculaArr", 0]
  }
}}, {$match: {
  peliculaObj: { $exists: true }
}}, {$addFields: {
  titulo: "$peliculaObj.title"
}}, {$project: {
  _id: 0,
  name: 1,
  text: 1,
  titulo: 1
}}]

# Reto2
[{$lookup: {
  from: 'users',
  localField: 'email',
  foreignField: 'email',
  as: 'userArr'
}}, {$addFields: {
  userObj: {
    $arrayElemAt: [ "$userArr", 0]
  }
}}, {$match: {
  userObj: { $exists: true }
}}, {$addFields: {
  pass: "$userObj.password"
}}, {$project: {
  _id: 0,
  name: 1,
  pass: 1
}}]

# Ej3
## Crear vista

# Proyecto 6
[{$project: {
  title: 1,
  genres: 1,
  countries: 1,
  _id: 0
}}, {$unwind: {
  path: '$countries'
}}, {$unwind: {
  path: '$genres'
}}, {$group: {
  _id: {
    pais: '$countries',
    genero: '$genres'
  },
  titulos: {
    $sum: 1
  }
}}, {$project: {
  pais: '$_id.pais',
  genero: '$_id.genero',
  titulos: 1,
  _id: 0
}}, {$sort: {
  titulos: -1
}}]