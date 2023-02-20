import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../entities/cocktail_ingredient.dart';
import '../repositories/details_repository.dart';

class GetDetailsUseCase
    extends UseCase<GetDetailsUseCaseResponse, GetDetailsUseCaseParams> {
  final DetailsRepository detailsRepository;

  GetDetailsUseCase(this.detailsRepository);

  @override
  Future<Stream<GetDetailsUseCaseResponse?>> buildUseCaseStream(
      GetDetailsUseCaseParams? params) async {
    final controller = StreamController<GetDetailsUseCaseResponse>();
    try {
      final ingredient =
          await detailsRepository.cocktailByIngredient(params!._name);
      controller.add(GetDetailsUseCaseResponse(ingredient));
      logger.finest('GetUserUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetUserUseCase unsuccessful.');
      // Trigger .onError
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetDetailsUseCaseParams {
  final String _name;

  String get name => _name;

  GetDetailsUseCaseParams(this._name);
}

class GetDetailsUseCaseResponse {
  final List<CocktailIngredient> details;

  GetDetailsUseCaseResponse(this.details);
}
