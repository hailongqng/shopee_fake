import 'package:shopee_fake/app/models/example_obj.dart';
import 'package:shopee_fake/common/http_client.dart';

class ExampleRepository {
  static ExampleRepository? _instance;

  ExampleRepository._internal();

  factory ExampleRepository() => _instance ?? ExampleRepository._internal();

  Future<ExampleObj> fetchRandomDog() async {
    final client = HttpClient("");
    final response = await client.getRequest(
      "/breeds/image/random",
      null,
    );
    return ExampleObj(imageUrl: response);
  }
}
