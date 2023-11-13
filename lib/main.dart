import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/daily_news/presentation/bloc/articel/remote/remote_articel_event.dart';
import 'features/daily_news/presentation/bloc/articel/remote/remote_article_bloc.dart';
import 'config/theme/app_theme.dart';
import 'features/daily_news/presentation/pages/home/daily_news.dart';

import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
