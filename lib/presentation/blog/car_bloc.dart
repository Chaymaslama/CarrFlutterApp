
import 'package:flutter_bloc/flutter_bloc.dart';

// Importing the use case and BLoC-related files
import '../../domain/usecases/get_cars.dart'; // The use case to fetch the list of cars
import 'car_event.dart'; // File containing event definitions for the CarBloc
import 'car_state.dart'; // File containing state definitions for the CarBloc

// Defining the CarBloc class which handles business logic for car-related features.
// It takes events of type CarEvent and outputs states of type CarState.
class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars; // Use case to get the list of cars

  // Constructor: requires the getCars use case and initializes the initial state to CarsLoading
  CarBloc({required this.getCars}) : super(CarsLoading()) {

    // Registering an event handler for the LoadCars event
    on<LoadCars>((event, emit) async {
      emit(CarsLoading()); // Emit a loading state to indicate data is being fetched

      try {
        // Attempt to fetch the list of cars using the use case
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });
  }
}
