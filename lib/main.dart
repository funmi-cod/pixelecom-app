import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelecomapp/src/core/router/app_route.dart';
import 'package:pixelecomapp/src/core/utils/constant/app_colors.dart';
import 'package:pixelecomapp/src/features/app_intro/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 740),

      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: "Mapp",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.black300,
            ),
            primarySwatch: Colors.yellow,
            fontFamily: 'EB Garamond',
          ),
          onGenerateRoute: AppRouter.generateRoute,
          home: const SplashScreen(),
        );
      },
    );
  }
}
