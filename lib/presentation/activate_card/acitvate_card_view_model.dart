import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/data/card/card_repo.dart';
import 'package:taptohello/data/card/models/activate_card_model.dart';

import 'package:taptohello/helper/base_view_model.dart';
import 'package:taptohello/presentation/activate_card/activation_screen.dart';
import 'package:taptohello/provider/repository_provider.dart';

import '../../helper/base_screen_view.dart';

final activateCardViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => ActivateCardViewModel(ref.read(cardProvider)),
);

class ActivateCardViewModel extends BaseViewModel<BaseScreenView> {
  final CardRepo _cardRepo;

  ActivateCardRequest activateCardRequest =
      const ActivateCardRequest(cardId: "");

  ActivateCardViewModel(
    this._cardRepo,
  );
  Future<void> activateCard(
      ActivateCardRequest activateCardRequest, BuildContext context) async {
    await _cardRepo.addCard(activateCardRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message.toString());
          }, (r) async {
            showDialog(
                context: context,
                builder: (context) => ActivateSuccess());

            // view?.showSnackbar("Card is activated");
            // _newsListResponse = r;
          }),
        );
    toggleLoading();
  }
}
