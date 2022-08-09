import 'package:user_friends/modules/core/utils/consts.dart';

import '../error/failures.dart';

class StringMapper {
  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case ConnectionFailure:
        return connectionFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
