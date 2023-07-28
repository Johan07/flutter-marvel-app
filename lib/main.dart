import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/domain/repositories/api_repository.dart';
import 'package:marvel_app/presentation/cubits/marvel_characters/marvel_characters_cubit.dart';
import 'config/router/app_routert.dart';
import 'config/themes/app_themes.dart';
import 'dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarvelCharactersCubit(getIt<ApiRepository>()),
      child: MaterialApp.router(
        title: 'Marvel App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: router,
      ),
    );
  }
}
