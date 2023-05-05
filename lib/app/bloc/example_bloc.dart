import 'package:rxdart/rxdart.dart';
import 'package:shopee_fake/app/bloc/bloc_provider.dart';
import 'package:shopee_fake/app/models/example_obj.dart';
import 'package:shopee_fake/app/repository/example_repository.dart';

class ExampleBloc extends Bloc {
  final _dogStream = BehaviorSubject<ExampleObj>();

  ExampleObj get dog => _dogStream.value;

  Stream<ExampleObj> get dogStream => _dogStream.stream;

  ExampleBloc() {
    getRandomDog();
  }

  void getRandomDog() async {
    final repo = ExampleRepository();
    final dog = await repo.fetchRandomDog();
    _dogStream.sink.add(dog);
  }

  @override
  void dispose() {
    _dogStream.close();
  }
}
