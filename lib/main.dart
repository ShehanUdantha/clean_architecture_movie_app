import 'dart:io';

import 'features/favorite/presentation/bloc/favorite/favorite_bloc.dart';
import 'features/movie/presentation/bloc/movie/movie_bloc.dart';

import 'config/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator.dart' as service_locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.serviceLocator();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => service_locator.sl<MovieBloc>()
            ..add(
              GetUpComingMoviesEvent(),
            )
            ..add(
              GetTrendingMoviesEvent(),
            )
            ..add(
              GetPopularMoviesEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => service_locator.sl<FavoriteBloc>()
            ..add(
              GetAllFavoriteMoviesEvent(),
            ),
        ),
      ],
      child: MaterialApp.router(
        title: 'MovieRay',
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
