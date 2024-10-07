import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    // Register the event handler for LoadHomeDataEvent
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        // Simulate data fetching
        await Future.delayed(const Duration(seconds: 2));

        // Example data for categories and products
        final categories = ['Electronics', 'Fashion', 'Home', 'Books', 'Toys'];
        final products = [
          {'name': 'Smartphone', 'price': '\$299', 'image': 'assets/smartphone.png'},
          {'name': 'Laptop', 'price': '\$899', 'image': 'assets/laptop.png'},
          {'name': 'Headphones', 'price': '\$199', 'image': 'assets/headphones.png'},
          {'name': 'Shoes', 'price': '\$49', 'image': 'assets/shoes.png'},
          {'name': 'Watch', 'price': '\$199', 'image': 'assets/watch.png'},
          {'name': 'Bag', 'price': '\$99', 'image': 'assets/bag.png'},
        ];

        emit(HomeLoaded(categories: categories, products: products));
      } catch (e) {
        emit(HomeError());
      }
    });
  }
}
