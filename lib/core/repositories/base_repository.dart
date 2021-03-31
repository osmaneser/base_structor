import 'package:base_structor/core/services/http_service.dart';

import '../init/locator.dart';

class BaseRepository {
  HttpService http;
  BaseRepository() {
    print("Base Repo Init");
    http = locator<HttpService>();
  }
}
