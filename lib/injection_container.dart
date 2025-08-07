import 'package:carapp/presentation/blog/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/firebase_car_data_source.dart';
import 'data/repositories/car_repository_impl.dart';
import 'domain/repositories/car_repository.dart';
import 'domain/usecases/get_cars.dart';

// Instanciation de GetIt, un conteneur d’injection de dépendances

GetIt getIt = GetIt.instance;
void initInjection(){
  //Enregistrement des dépendances dans GetIt
  try{
    //E l’instance unique de FirebaseFirestore
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    // Enregistre la source de données personnalisée Firebase pour les voitures
    getIt.registerLazySingleton<FirebaseCarDataSource>(
            () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
    );
    // // Enregistre l’implémentation du repository, qui utilise FirebaseCarDataSource
    getIt.registerLazySingleton<CarRepository>(
            () => CarRepositoryImpl(getIt<FirebaseCarDataSource>())
    );
    // Enregistre le cas d’usage (use case) pour obtenir les voitures,
    getIt.registerLazySingleton<GetCars>(
            () => GetCars(getIt<CarRepository>())
    );
    // Enregistre une nouvelle instance de CarBloc à chaque fois qu’on la demande,
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));

  } catch (e){
    throw e;
  }
}