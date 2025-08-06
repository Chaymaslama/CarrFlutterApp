

import '../../domain/repositories/car_repository.dart';
import '../datasources/firebase_car_data_source.dart';
import '../models/car.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}