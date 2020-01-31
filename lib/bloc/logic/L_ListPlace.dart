import 'dart:io';

import 'package:rxdart/rxdart.dart';

import 'package:dot_flutter_test/bloc/repository.dart';

class Bloc {
  final _repository = Repository();
  final _hasConnection = BehaviorSubject<bool>.seeded(false);
  final _listPlace = BehaviorSubject<dynamic>();

  //add stream
  Function(dynamic) get updatePlace => _listPlace.sink.add;
  Function(dynamic) get updatePlaceError => _listPlace.sink.addError;
  Function(bool) get updateHasConnection => _hasConnection.sink.add;
  //get stream
  Stream<dynamic> get getPlace => _listPlace.stream;

  //function
  getPlaceVal() {
    return _listPlace.value;
  }

  Future<void> fetchAllPlace() async {
    await checkConnection();
    if (_hasConnection.value) {
      dynamic placeList = await _repository.fetchPlaceRepo();
      updatePlace(placeList);
    } else {
      updatePlaceError(
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
