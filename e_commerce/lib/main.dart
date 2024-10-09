import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/featutres/cart/presentation/views/cart_view.dart';
import 'src/featutres/home/presentation/blocs/bloc/home_bloc.dart';
import 'src/featutres/home/presentation/blocs/bloc/home_event.dart';
import 'src/featutres/home/presentation/views/home_view.dart';
import 'src/featutres/product/presentation/views/product_details_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(LoadHomeDataEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/productDetails') {
            final product = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) {
                return ProductDetailsView(product: product);
              },
            );
          }
          return null; // Fallback in case of an unknown route
        },
        routes: {
          '/': (context) => const HomeView(),
          '/cart': (context) => const CartView(),
        },
      ),
    );
  }
}
