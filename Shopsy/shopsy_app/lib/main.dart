import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopsy_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:shopsy_app/routes/app_router.dart';
import 'package:shopsy_app/theme/app_colors.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  // Ensure Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  // System UI settings
  _setSystemUI();

  // Initialize dependencies
  await _initializeDependencies();

  _setCustomErrorWidget();
  runApp(MyApp());
}

/// **App Entry Point**
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CartCubit()..loadCart()),
          ],
          child: MaterialApp.router(
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF673AB7), // Deep Purple
                brightness: Brightness.light,
                primary: const Color(0xFF673AB7),
                secondary: const Color(0xFF009688), // Teal
              ),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black87,
              ),
              cardTheme: CardThemeData(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child ?? const SizedBox(),
              );
            },
          ),
        );
      },
    );
  }
}

/// System UI Configuration
void _setSystemUI() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarDividerColor: AppColors.white,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

/// Initialize Dependencies
Future<void> _initializeDependencies() async {
  await GetStorage.init();
}

/// Custom Error Widget for Global Error Handling
void _setCustomErrorWidget() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Text(
          'Error!\n${details.exception}',
          style: const TextStyle(color: Colors.black38),
          textAlign: TextAlign.center,
        ),
      ),
    );
  };
}
