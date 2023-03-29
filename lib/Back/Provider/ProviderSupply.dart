// ignore_for_file: file_names
import 'package:attitude_indicator/Back/Provider/Providers/SerialCummProvider.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> providerSupply() {
  return [ChangeNotifierProvider(create: (_) => SerialCummProvider())];
}
