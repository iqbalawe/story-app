import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/core.dart';
import 'package:story_app/src/features/auth/data/data.dart';
import 'package:story_app/src/features/auth/presentation/bloc/bloc.dart';
import 'package:story_app/src/features/story/data/data.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'src/features/story/presentation/presentation.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  timeago.setLocaleMessages('id', timeago.IdMessages());

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
        BlocProvider(create: (context) => AddStoryBloc(storyRepository)),
        BlocProvider(
          create: (context) =>
              LocalizationBloc(storage: storage)..add(LoadSavedLanguage()),
        ),
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
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Story App',
          locale: state.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('id')],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
