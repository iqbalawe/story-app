import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:story_app/src/core/network/dio_client.dart';
import 'package:story_app/src/core/router/app_router.dart';
import 'package:story_app/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:story_app/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:story_app/src/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:story_app/src/features/story/data/datasources/story_remote_datasource.dart';
import 'package:story_app/src/features/story/data/repositories/story_repository_impl.dart';
import 'package:story_app/src/features/story/presentation/blocs/detail/story_detail_bloc.dart';
import 'package:story_app/src/features/story/presentation/blocs/story/story_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dioClient = DioClient();
  const storage = FlutterSecureStorage();

  final authDatasource = AuthRemoteDatasourceImpl(
    dioClient: dioClient,
    storage: storage,
  );
  final authRepository = AuthRepositoryImpl(remoteDatasource: authDatasource);
  final authBloc = AuthBloc(repository: authRepository);

  final storyDatasource = StoryRemoteDatasourceImpl(
    dioClient: dioClient,
    storage: storage,
  );
  final storyRepository = StoryRepositoryImpl(
    remoteDatasource: storyDatasource,
  );

  final appRouter = AppRouter(authBloc);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc..add(AuthCheckRequested())),
        BlocProvider(
          create: (context) => StoryBloc(storyRepository: storyRepository),
        ),
        BlocProvider(create: (context) => StoryDetailBloc(storyRepository)),
      ],
      child: MyApp(appRouter: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter, super.key});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Story App',
      routerConfig: appRouter.router,
    );
  }
}
