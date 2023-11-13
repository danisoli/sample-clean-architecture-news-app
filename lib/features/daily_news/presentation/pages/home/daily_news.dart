import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/articel/remote/remote_article_bloc.dart';
import '../../bloc/articel/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is RemoteArticleError) {
          log(state.error!.message ?? 'null');
          return const Center(
            child: Icon(Icons.refresh),
          );
        } else if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('$index'),
            ),
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
