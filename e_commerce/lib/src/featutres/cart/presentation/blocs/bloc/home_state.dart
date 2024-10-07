import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> categories;
  final List<Map<String, String>> products;

  const HomeLoaded({required this.categories, required this.products});

  @override
  List<Object> get props => [categories, products];
}

class HomeError extends HomeState {}
