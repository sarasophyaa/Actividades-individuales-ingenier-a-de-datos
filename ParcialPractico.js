db.bandas.insertMany([
  {name: "Maverick City",
    country: "USA",
    members: ["Chandler", "Nidia", "Stefanny"],
    albums: [
      { title: "Kingdom", year: 2023, rating: 10, sales: 1500 },
      { title: "In the room", year: 2022, rating: 8, sales: 2000 }
    ]
  },
  {
    name: "Sam Smith",
    country: "USA",
    albums: [
      { title: "The lover that I lost", year: 2021, rating: 7, sales: 3000 },
      { title: "Midnight Train", year: 2020, rating: 6, sales: 4000 }
    ]
  },
  {name: "Grupo Niche",
  country: "Colombia",}
]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('690b5727d52b87915ae4a765'),
    '1': ObjectId('690b5727d52b87915ae4a766'),
    '2': ObjectId('690b5727d52b87915ae4a767')
  }
}
db.bandas.insertMany([
  {name: "Maverick City",
    country: "USA",
    members: ["Chandler", "Nidia", "Stefanny"],
    albums: [
      { title: "Kingdom", year: 2023, rating: 10, sales: 1500 },
      { title: "In the room", year: 2022, rating: 8, sales: 2000 }
    ]
  },
  {
    name: "Sam Smith",
    country: "USA",
    albums: [
      { title: "The lover that I lost", year: 2021, rating: 7, sales: 3000 },
      { title: "Midnight Train", year: 2020, rating: 6, sales: 4000 }
    ]
  },
  {name: "Grupo Niche",
  country: "Colombia",
  albums:[
    {title: "Gotas de lluvia", year:1987, rating:8, sale:4000},
    {title: "Busca por dentro", year:1989, rating:9 , sale: 5000},
  ]}

//Reto 1
]);
db.bandas.aggregate  ([
  {$unwind: "$albums"},
  {$group: 
  {
    _id: "$name",
    albumCount: {$sum:1},
    totalVentas: {$sum: "$albums.sales"}
  }
  },
  {$sort:{albumCount: -1}}
])

//Reto 2
db.bandas.aggregate  ([
  {$unwind: "$albums"},
  {$group: 
  {
    _id: "$name",
    albumCount: {$sum:1},
    totalVentas: {$sum: "$albums.sales"}
  }
  },
  {$sort:{albumCount: -1}}, 
{$limit: 2}
])

//reto 3
db.bandas.aggregate  ([
  {$unwind: "$albums"},
  {$group: 
  {
    _id: "$country",
    ratingPromedio: {$avg: "$album.rating" },
    cantidadAlbum: {$sum: 1}
  }
  }
])