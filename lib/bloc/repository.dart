import 'package:dot_flutter_test/bloc/apiProvider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future fetchPlaceRepo() async {
    return await apiProvider.fetchPlaceApi();
  }

  Future fetchGalleryRepo() async {
    return await apiProvider.fetchGalleryApi();
  }
}
