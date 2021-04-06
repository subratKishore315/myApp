import 'package:get_it/get_it.dart';
import 'package:login/CommonClasses/calls_and_messages_services.dart';

GetIt locator = GetIt.instance;

void  setUpLocator() {
  locator.registerSingleton(CallsAndMessagesServices());
}
