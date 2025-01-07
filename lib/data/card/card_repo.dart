import 'package:dartz/dartz.dart';
import 'package:swapnil_s_application4/data/auth/model/add_service.dart';
import 'package:swapnil_s_application4/data/auth/model/login.dart';
import 'package:swapnil_s_application4/data/auth/model/registration.dart';
import 'package:swapnil_s_application4/data/auth/model/services.dart';
import 'package:swapnil_s_application4/data/auth/model/success_response.dart';
import 'package:swapnil_s_application4/data/auth/model/update_user.dart';
import 'package:swapnil_s_application4/data/auth/model/user_detail.dart';
import 'package:swapnil_s_application4/data/auth/model/user_services.dart';
import 'package:swapnil_s_application4/data/card/models/activate_card_model.dart';
import 'package:swapnil_s_application4/data/card/models/connected_users.dart';
import 'package:swapnil_s_application4/data/card/models/remove_contact.dart';

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
