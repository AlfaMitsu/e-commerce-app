import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'src/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'src/features/cart/presentation/views/cart_view.dart';
import 'src/features/home/presentation/blocs/bloc/product_bloc.dart';
import 'src/features/home/presentation/blocs/bloc/product_event.dart';
import 'src/features/home/presentation/views/home_view.dart';
import 'src/features/login/presentation/blocs/bloc/login_bloc.dart';
import 'src/features/login/presentation/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(FirebaseAuth.instance),
        ),
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(FirebaseFirestore.instance)..add(LoadProducts()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginView(),
          '/home': (context) => const HomeView(),
          '/cart': (context) => const CartView(),
        },
      ),
    );
  }
}
