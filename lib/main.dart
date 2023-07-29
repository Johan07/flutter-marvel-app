import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/repositories/api_repository.dart';
import 'config/router/app_routert.dart';
import 'config/themes/app_themes.dart';
import 'dependencies.dart';
import 'presentation/views/home/cubits/marvel_characters/marvel_characters_cubit.dart';

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
