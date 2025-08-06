import 'package:carapp/data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:carapp/presentation/widgets/car_card.dart';
import '../widgets/car_card.dart';

class CarListScreen extends StatelessWidget {

  final List<Car> cars=[
    Car(model: 'Fortuner GR', distance:878, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortuner GR', distance:878, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortuner GR', distance:878, fuelCapacity: 50, pricePerHour: 45),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(itemCount: cars.length,
          itemBuilder : (context, index){
            return CarCard(car:cars[index]);
          },
      ),
    );
  }
}
