import 'package:flutter/material.dart';

class Seeds {
  final String imageurl;
  final String title;
  final int price;
  final int quantity;
  final String temperature;
  final String subtitle;
  final String daystomaturity;
  final String sowingdistance;
  final String idealspacing;
  final String watering;
  final String soil;
  final String phrange;
  final String id;
  final int quantities;
  const Seeds({
    this.id,
    this.title,
    this.imageurl,
    this.price,
    this.quantity,
    this.temperature,
    this.subtitle,
    this.idealspacing,
    this.daystomaturity,
    this.phrange,
    this.soil,
    this.sowingdistance,
    this.watering,
    this.quantities,
  });
}

const Items = const [
  Seeds(
      id: "1",
      title: "MuskMelon Seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/muskM_medium.jpg?v=1600087358",
      price: 65,
      quantity: 50,
      temperature: "15-25 °c",
      subtitle: "Fruits",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "2",
      title: "Pomegarnate Seeds",
      imageurl:
          "https://www.thespruceeats.com/thmb/eSLzIUiEwTQ5NF7D8YVWif7d1Q8=/3865x2174/smart/filters:no_upscale()/pomegranate-fruit-on-cut-board-157685468-588901525f9b5874ee801d3e.jpg",
      price: 105,
      quantity: 50,
      temperature: "15-25 °c",
      subtitle: "Fruits",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "3",
      title: "Fig",
      imageurl:
          "https://cdn.tridge.com/image/original/f8/60/a9/f860a94dc1a5f58745800b516756afeff6e9c499.jpg",
      price: 85,
      quantity: 60,
      temperature: "15-25 °c",
      subtitle: "Fruits",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "4",
      title: "Broccolli Seeds",
      imageurl:
          "https://solidstarts.com/wp-content/uploads/Broccoli_edited-480x320.jpg",
      price: 80,
      quantity: 50,
      temperature: "15-25 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "5",
      title: "Spinach Seeds",
      imageurl:
          "https://5.imimg.com/data5/TO/JM/NY/SELLER-77767236/image-500x500.jpg",
      price: 70,
      quantity: 100,
      temperature: "15-25 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "6",
      title: "Tomato Seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Tomato-Oval_medium.jpg?v=1598083169",
      price: 60,
      quantity: 100,
      temperature: "15-25 °c",
      subtitle: "Vegetables",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "7",
      title: "Capsicum Seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Capsicum-Green_600x600.jpg?v=1598079442",
      price: 85,
      quantity: 100,
      temperature: "15-25 °c",
      subtitle: "Vegetables",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "8",
      title: "BeetRoot Seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Beet-Root-Ruby-Red_medium.jpg?v=1598078262",
      price: 60,
      quantity: 50,
      temperature: "15-25 °c",
      subtitle: "Vegetables",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "9",
      title: "Clerey Seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/CALERY_600x600.jpg?v=1598076218",
      price: 65,
      quantity: 250,
      temperature: "15-25 °c",
      subtitle: "Herbs",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "10",
      title: "Chive seeds",
      imageurl:
          'https://cdn.shopify.com/s/files/1/1380/2059/products/Chives_600x600.png?v=1598076332',
      price: 100,
      quantity: 300,
      temperature: '15-25 °c',
      subtitle: 'Herbs',
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "11",
      title: "Coriander seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Coriander_600x600.jpg?v=1598076422",
      price: 75,
      quantity: 200,
      temperature: "15-25 °c",
      subtitle: "Herbs",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "12",
      title: "Arugula seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/eruca_600x600_8de33696-5de8-4182-9f98-ba78f0a26203_600x600.png?v=1598076543",
      price: 130,
      quantity: 250,
      temperature: "15-25 °c",
      subtitle: "Herbs",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "13",
      title: "Oregano seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/oregano_grande_a2439762-89c6-4135-8b25-0d2e88bb09ad_600x600.jpg?v=1598076967",
      price: 95,
      quantity: 300,
      temperature: "15-25 °c",
      subtitle: "Herbs",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "14",
      title: "Okara seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Okra-Summer-Beauty_600x600.jpg?v=1598081569",
      price: 60,
      quantity: 50,
      temperature: "25-35 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "15",
      title: "Green chillies long seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/CHILLI_LONG_cf4e7576-01ef-42b2-83e4-b56b9d69f889_600x600.jpg?v=1598080251",
      price: 75,
      quantity: 75,
      temperature: "25-35 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "16",
      title: "Chillies yellow seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Chillies-Yellow_600x600.jpg?v=1598080344",
      price: 65,
      quantity: 100,
      temperature: "25-35 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "17",
      title: "Brinjal cluster small seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Brinjal-Cluster-Small_600x600.jpg?v=1598078769",
      price: 60,
      quantity: 100,
      temperature: "25-35 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "18",
      title: "Carrot orange seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Carrot-Orange_600x600.jpg?v=1598079671",
      price: 105,
      quantity: 300,
      temperature: "25-35 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "19",
      title: "Watermelon black seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/WATERMELON_BLACK_ROUND_600x600.jpg?v=1600087456",
      price: 70,
      quantity: 20,
      temperature: "25-35 °c",
      subtitle: "Fruits",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "20",
      title: "Yellow melon seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Melon-Yellow_600x600.jpg?v=1600087720",
      price: 70,
      quantity: 20,
      temperature: "25-35 °c",
      subtitle: "Fruits",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "21",
      title: "Watermelon green round seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/shutterstock_149970902_600x600.jpg?v=1600087545",
      price: 70,
      quantity: 20,
      temperature: "25-35 °c",
      subtitle: "Fruits",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "22",
      title: "Watermelon oval seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Water-Melon-Striped-Oval_600x600.jpg?v=1600087635",
      price: 70,
      quantity: 20,
      temperature: "25-35 °c",
      subtitle: "Fruits",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "23",
      title: "sweet potato",
      imageurl:
          "https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Sweet-potatoes-ca0d8f4.jpg?quality=90&resize=960,872",
      price: 70,
      quantity: 20,
      temperature: "35-45 °c",
      subtitle: "Vegetables",
      daystomaturity: "60-70 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering:
          "Water thoroughly and make sure to soak the soil to a depth of 6-8 inches",
      quantities: 1),
  Seeds(
      id: "24",
      title: "Green beans",
      imageurl:
          "https://cdn.loveandlemons.com/wp-content/uploads/2014/11/green-beans-3.jpg",
      price: 70,
      quantity: 15,
      temperature: "35-45 °c",
      subtitle: "Vegetables",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "25",
      title: "Cucumber seeds",
      imageurl:
          "https://cdn.shopify.com/s/files/1/1380/2059/products/Cucumber_600x600.jpg?v=1598080603",
      price: 65,
      quantity: 20,
      temperature: "35-45 °c",
      subtitle: "Vegetables",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "26",
      title: "Corn seeds",
      imageurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2unNOWIh3a6igRjLXHUxtmcvx-MSzsdV0Tg&usqp=CAU",
      price: 90,
      quantity: 50,
      temperature: "35-45 °c",
      subtitle: "Vegetables",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1),
  Seeds(
      id: "27",
      title: "Egg plant",
      imageurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4N_4fDwaNIv0-06c5PLj3Qle2ipY7gV2WXg&usqp=CAU",
      price: 80,
      quantity: 30,
      temperature: "35-45 °c",
      subtitle: "Vegetables",
      daystomaturity: "50-60 from transplanting",
      idealspacing: "24-36 inches",
      phrange: "6-6.8",
      soil: "Well Drained soil like clay, slit",
      sowingdistance: "1 inches",
      watering: "4- 4.5 liter per week ",
      quantities: 1)
];

class Seed with ChangeNotifier {
  List<Seeds> dseeds = Items;
  List<Seeds> get dseed {
    return dseeds;
  }

  void filteredseeds(String ftemperature, String fseed) {
    print(ftemperature);
    print(fseed);
    if ((ftemperature == null || ftemperature.isEmpty) && fseed == null) {
      dseeds = Items;
    } else if (ftemperature == "All") {
      dseeds = Items;
    } else if (ftemperature != null && fseed == null) {
      dseeds = Items.where((element) => element.temperature == ftemperature)
          .toList();
    } else if (ftemperature != null && fseed != null) {
      dseeds = Items.where((element) => (element.temperature == ftemperature &&
          element.subtitle == fseed)).toList();
    }
  }
}
