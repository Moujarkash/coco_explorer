import 'package:injectable/injectable.dart';

abstract class Configuration {
  String get endpointBaseUrl;
  String get baseUrl;
}

@LazySingleton(as: Configuration)
class AppConfiguration extends Configuration {
  @override
  String get endpointBaseUrl => 'https://us-central1-open-images-dataset.cloudfunctions.net/';

  @override
  String get baseUrl => "https://cocodataset.org/";
}
