import 'dart:io';

import 'package:rxdart/rxdart.dart';

import 'package:dot_flutter_test/bloc/repository.dart';

class Bloc {
  final _repository = Repository();
  final _hasConnection = BehaviorSubject<bool>.seeded(false);
  final _listGallery = BehaviorSubject<dynamic>();

  //add stream
  Function(dynamic) get updateGallery => _listGallery.sink.add;
  Function(dynamic) get updateGalleryError => _listGallery.sink.addError;
  Function(bool) get updateHasConnection => _hasConnection.sink.add;
  //get stream
  Stream<dynamic> get getGallery => _listGallery.stream;

  //function
  getGalleryVal() {
    return _listGallery.value;
  }

  Future<void> fetchAllGallery() async {
    await checkConnection();
    if (_hasConnection.value) {
      dynamic galleryList = await _repository.fetchGalleryRepo();
      updateGallery(galleryList);
    } else {
      updateGalleryError(
          'Oops, something went wrong, just refresh the page or check your connectivity');
    }
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        updateHasConnection(true);
      } else {
        updateHasConnection(false);
      }
    } on SocketException catch (_) {
      updateHasConnection(false);
    }
  }
}

final bloc = Bloc();
