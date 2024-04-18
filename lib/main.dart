import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makalam_homework/feature/presentation/bloc/page_load_bloc/page_load_bloc.dart';
import 'package:makalam_homework/feature/presentation/pages/home_page.dart';
import 'package:makalam_homework/firebase_options.dart';
import 'package:makalam_homework/locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageLoadBloc>(
      create: (context) => di.sl<PageLoadBloc>()..add(LoadPage(page: 1)),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
