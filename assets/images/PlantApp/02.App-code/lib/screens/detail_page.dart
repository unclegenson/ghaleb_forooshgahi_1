// NABEGHEHA.COM

import 'package:flutter/material.dart';
import 'package:plant_app_2/const/constants.dart';
import 'package:plant_app_2/models/plant.dart';
import 'package:plant_app_2/widgets/extensions.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({
    super.key,
    required this.plantId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          // AppBar
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // X Button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                // Like Button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantId].isFavorated == true ? Icons.favorite : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  // Product Image
                  Positioned(
                    top: 10.0,
                    left: 0.0,
                    child: SizedBox(
                      height: 350.0,
                      child: Image.asset(plantList[widget.plantId].imageURL),
                    ),
                  ),
                  // PlantFeature
                  Positioned(
                    top: 10.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            title: 'اندازه‌گیاه',
                            plantFeature: plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'رطوبت‌هوا',
                            plantFeature: plantList[widget.plantId].humidity.toString().farsiNumber,
                          ),
                          PlantFeature(
                            title: 'دمای‌نگهداری',
                            plantFeature: plantList[widget.plantId].temperature.toString().farsiNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Star
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constants.primaryColor,
                          ),
                          Text(
                            plantList[widget.plantId].rating.toString().farsiNumber,
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              color: Constants.primaryColor,
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ),
                      // Plant Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plantList[widget.plantId].plantName,
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          // Price
                          Row(
                            children: [
                              SizedBox(height: 19.0, child: Image.asset('assets/images/PriceUnit-green.png')),
                              const SizedBox(width: 10.0),
                              Text(
                                plantList[widget.plantId].price.toString().farsiNumber,
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Constants.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Product Description
                  const SizedBox(height: 15.0),
                  Text(
                    plantList[widget.plantId].decription,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'iranSans',
                      color: Constants.blackColor.withOpacity(0.7),
                      height: 1.6,
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 1.1),
                    blurRadius: 5.0,
                    color: Constants.primaryColor.withOpacity(0.3),
                  )
                ],
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5.0,
                      color: Constants.primaryColor.withOpacity(0.3),
                    )
                  ],
                ),
                child: Center(
                  child: InkResponse(
                    onTap: () {
                      setState(() {
                        bool isSelected = toggleIsSelected(plantList[widget.plantId].isSelected);
                        plantList[widget.plantId].isSelected = isSelected;
                      });
                    },
                    child: const Text(
                      'افزودن به سبد خرید',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    Key? key,
    required this.title,
    required this.plantFeature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lalezar',
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lalezar',
          ),
        ),
      ],
    );
  }
}
