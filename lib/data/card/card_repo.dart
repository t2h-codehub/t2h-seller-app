import 'package:dartz/dartz.dart';
import 'package:taptohello/data/auth/model/success_response.dart';
import 'package:taptohello/data/card/models/activate_card_model.dart';
import 'package:taptohello/data/card/models/connected_users.dart';
import 'package:taptohello/data/card/models/remove_contact.dart';

import '../../core/exceptions.dart';

abstract class CardRepo {
  Future<Either<ApiException, ActivateCardResponse>> addCard(
      ActivateCardRequest activateCardRequest);
  Future<Either<ApiException, ConnectedUserResponse>> getConnectedUsers();
  Future<Either<ApiException, SuccessResponse>> toggleFav(String uid);
  Future<Either<ApiException, SuccessResponse>> removeContact(
      RemoveConnectRequest removeConnectRequest);

  Future<Either<ApiException, ConnectedUserResponse>> searchConnects(
      String keyword);


}
