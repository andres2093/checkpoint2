# Uso de Having
SELECT clave, round(sum(precio),2) AS total
FROM venta AS v
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
GROUP BY clave
HAVING total > 35000
ORDER BY total;

# Recuperar datos después de un group
[{$addFields: {
  fechaNueva
  fecha: {
    $dateFromString: {
      dateString: '$Update Time',
      format: '%m/%d/%Y %H:%M'
    }
  }
}}, {$sort: {
  date: -1
}}, {$group: {
  _id: '$Country',
  user: {
    $first: '$$ROOT'
  }
}}, {$addFields: {
  Deaths: "$user.Deaths",
  Cases: "$user.Cases",
  Date: "$user.date"
}}, {$project: {
  user: 0
}}, {$sort: {
  Deaths: -1
}}]

# Cuando usar "" $
- Comillas simples o dobles cuando es un campo de tipo texto
- Signo de pesos cuando utilizamos una función de mongo: $sum, $avg
- Signo depesos y comillas simples o dobles cuando pasamos un campo como variable: "$country"

# GeoNear

# Datos
[
  {
    "_id": {
      "$oid": "5fc7d62c7e64af170cdb592d"
    },
    "Date": "03/03/2020 12:00",
    "Province": "1",
    "Region": "1",
    "Last Update": "2020-03-03T11:43:02",
    "Confirmed": 67217,
    "Deaths": 2835,
    "Recovered": 36208,
    "location": {
      "type": "Point",
      "coordinates": [
        -103.436099,
        20.630711
      ]
    }
  },
  {
    "_id": {
      "$oid": "5fc7e1c77e64af170cdb5931"
    },
    "Date": "03/03/2020 12:00",
    "Province": "2",
    "Region": "2",
    "Last Update": "2020-03-03T11:43:02",
    "Confirmed": 67218,
    "Deaths": 2836,
    "Recovered": 36209,
    "location": {
      "type": "Point",
      "coordinates": [
        -103.425832,
        20.634014
      ]
    }
  },
  {
    "_id": {
      "$oid": "5fc7e1d87e64af170cdb5932"
    },
    "Date": "03/03/2020 12:00",
    "Province": "3",
    "Region": "3",
    "Last Update": "2020-03-03T11:43:02",
    "Confirmed": 67219,
    "Deaths": 2837,
    "Recovered": 36210,
    "location": {
      "type": "Point",
      "coordinates": [
        -103.405726,
        20.646875
      ]
    }
  }
]

# Pipeline
[{$geoNear: {
  near: {
    type: 'Point',
    coordinates: [
      -103.436652,
      20.630669
    ]
  },
  distanceField: 'distance',
  maxDistance: 5000,
  query: { Deaths: { $gte: 2834 } },
  includeLocs: 'dist',
  spherical: false
}}]