import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/cubit/cubit.dart';
import 'package:responsive/cubit/states.dart';
import 'package:responsive/desktop.dart';
import 'package:responsive/mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResponsiveCubit(),
      child: BlocConsumer<ResponsiveCubit, ResponsiveState>(
          builder: (context, state) {
            ResponsiveCubit cubit = ResponsiveCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: TextTheme(
                  titleSmall:
                      const TextStyle(fontSize: 10, color: Colors.white),
                  displaySmall:
                      const TextStyle(fontSize: 8, color: Colors.grey),
                  titleMedium: const TextStyle(
                    color: Colors.white,
                  ),
                  bodyLarge: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyMedium: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  bodySmall: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              darkTheme: ThemeData(
                iconTheme: const IconThemeData(color: Colors.white),
                scaffoldBackgroundColor: Colors.black26,
                textTheme: TextTheme(
                  titleSmall:
                      const TextStyle(fontSize: 10, color: Colors.white),
                  displaySmall:
                      const TextStyle(fontSize: 8, color: Colors.grey),
                  titleMedium: const TextStyle(
                    color: Colors.white,
                  ),
                  bodyLarge: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  bodyMedium: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  bodySmall: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500]),
                ),
              ),
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: Builder(
                builder: (context) {
                  if (kDebugMode) {
                    print(MediaQuery.of(context).size.width);
                    print(' height : ${MediaQuery.of(context).size.height}');
                  }
                  if (MediaQuery.of(context).size.width <= 500) {
                    return MediaQuery(
                        data:
                            MediaQuery.of(context).copyWith(textScaleFactor: 1),
                        child: const MobilePage());
                  }
                  return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
                      child: DesktopPage());
                },
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
