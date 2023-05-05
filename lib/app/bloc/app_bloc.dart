import 'package:rxdart/subjects.dart';
import 'package:shopee_fake/app/bloc/bloc_provider.dart';
import 'package:shopee_fake/app/models/app_config.dart';

class AppBloc extends Bloc {
  final _configStream = BehaviorSubject<AppConfig>();
  AppConfig get config => _configStream.value;
  set config(AppConfig c) => _configStream.sink.add(c);
  Stream<AppConfig> get configStream => _configStream.stream;

  @override
  void dispose() {
    _configStream.close();
  }
}
