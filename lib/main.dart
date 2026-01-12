import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:story_app/src/core/network/dio_client.dart';
import 'package:story_app/src/core/router/app_router.dart';
import 'package:story_app/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:story_app/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:story_app/src/features/auth/presentation/blocs/bloc/auth_bloc.dart';

void main() {
  final dioClient = DioClient();
  const storage = FlutterSecureStorage();
  final authDatasource = AuthRemoteDatasourceImpl(
    dioClient: dioClient,
    storage: storage,
  );
  final authRepository = AuthRepositoryImpl(remoteDatasource: authDatasource);
  final authBloc = AuthBloc(repository: authRepository);

  runApp(MyApp(authBloc: authBloc));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.authBloc, super.key});

  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(authBloc);

    return BlocProvider.value(
      value: authBloc..add(AuthCheckRequested()),
      child: MaterialApp.router(
        title: 'Story App',
        routerConfig: appRouter.router,
      ),
    );
  }
}
