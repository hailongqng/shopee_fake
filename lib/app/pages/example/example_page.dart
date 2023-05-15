import 'package:flutter/material.dart';
import 'package:shopee_fake/app/bloc/example_bloc.dart';
import 'package:shopee_fake/app/models/example_obj.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';

class ExamplePageArguments {
  final String title;

  ExamplePageArguments({required this.title});
}

class ExamplePage extends StatelessWidget {
  static const routePath = "/example";

  static Widget registerRoute(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is ExamplePageArguments) {
      return ExamplePage(title: args.title);
    }
    return ExamplePage(title: "Flutter Demo");
  }

  ExamplePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final _bloc = ExampleBloc();

  @override
  Widget build(BuildContext context) {
    // You can access AppBloc by
    // final appBloc = BlocProvider.of<AppBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 40),
            StreamBuilder<ExampleObj>(
              stream: _bloc.dogStream,
              builder: (ctx, snap) {
                if (snap.hasData) {
                  return Image.network(snap.data!.imageUrl);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bloc.getRandomDog,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
