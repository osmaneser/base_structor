import 'package:base_structor/core/repositories/auth_repository.dart';
import 'package:base_structor/core/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => GlobalKey<NavigatorState>());
  locator.registerLazySingleton(() => HttpService());
  locator.registerLazySingleton(() => AuthRepository());
}
