import 'dart:async';

import 'package:acceso_movilidad/src/domain/entities/details_cocktail.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repositories/details_repository.dart';

class GetCocktailUseCase
    extends UseCase<GetCocktailUseCaseResponse, GetCocktailUseCaseParams> {
  final DetailsRepository detailsRepository;

  GetCocktailUseCase(this.detailsRepository);

  @override
  Future<Stream<GetCocktailUseCaseResponse?>> buildUseCaseStream(
      GetCocktailUseCaseParams? params) async {
    final controller = StreamController<GetCocktailUseCaseResponse>();
    try {
      final ingredient = await detailsRepository.cocktailDetails(params!._id);
      controller.add(GetCocktailUseCaseResponse(ingredient));
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

class GetCocktailUseCaseParams {
  final num _id;

  num get id => _id;

  GetCocktailUseCaseParams(this._id);
}

class GetCocktailUseCaseResponse {
  final DetailsCocktail cocktail;

  GetCocktailUseCaseResponse(this.cocktail);
}
