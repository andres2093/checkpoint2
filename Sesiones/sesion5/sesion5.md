
## Reto 1
# Propiedades que no permitan fiestas.
{ house_rules: /No Parties/i }
# Propiedades que admitan mascotas.
{ 
    $and: [ 
        { house_rules: /pets allowed/i }, 
        { house_rules: { $not: /no pets allowed/i } }
    ] 
}
# Propiedades que no permitan fumadores.
{ house_rules: /No Smoking/i }
# Propiedades que no permitan fiestas ni fumadores.
{ house_rules: /No Smoking|No Parties/i }

## Ej 2
# Buscar en objeto
{ "address.country": "Spain" }
# Buscar en arreglo
{ "amenities": { $in: [ "Kitchen" ] } }

# Lista de todas las publicaciones con un costo menor a 100, que se encuentren en España, con una valoración de 50 o más puntos, que cuenten con Internet o Wifi y que tegan Elevador.
{ 
    $and: [ 
        { price: { $lte: 100 } }, 
        { "address.country": "Spain" }, 
        { "review_scores.review_scores_rating": { $gte: 50 } }, 
        { amenities: 
            { $in: [ 
                /Internet/i, 
                /Wifi/i 
                ] 
            } 
        }, 
        { amenities: 
            { $in: 
                [ 
                    /Elevator/i
                ] 
            } 
        } 
    ] 
}

# Reto 2
# Obtener todas las publicaciones que tengan 50 o más comentarios, que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet vía cable /Ethernet/i y estén ubicada en Brazil.
{
    $and:[
        { number_of_reviews: { $gte: 50 } },
        { "review_scores.review_scores_rating": { $gte:80 } },
        { amenities: { $in: [ /Ethernet/i ] } },
        { "address.country": /Brazil/i }
    ]
}

# Ej 3
[{$addFields: {
  servicios: { $size: "$amenities" }
}}, {$project: {
  name: 1,
  servicios: 1,
  _id: 0
}}, {$sort: {
  servicios: -1
}}, {$limit: 1}]

# Reto 3
# Mediante el uso de agregaciones, encontrar el número de publicaciones que tienen conexión a Internet, sea desde Wifi o desde cable (Ethernet).
[{$match: {
   amenities: {$in: ["Wifi", "Ethernet"]}
}}, {$group: {
  _id: null,
  total: {
    $sum: 1
  }
}}]