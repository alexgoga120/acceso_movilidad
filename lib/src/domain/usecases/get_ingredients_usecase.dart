import 'dart:async';

import 'package:acceso_movilidad/src/domain/entities/list_ingredients.dart';
import 'package:acceso_movilidad/src/domain/repositories/ingredients_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetIngredientsUseCase extends UseCase<GetIngredientsUseCaseResponse,
    GetIngredientsUseCaseParams> {
  final IngredientsRepository ingredientsRepository;

  GetIngredientsUseCase(this.ingredientsRepository);

  @override
  Future<Stream<GetIngredientsUseCaseResponse?>> buildUseCaseStream(
      GetIngredientsUseCaseParams? params) async {
    final controller = StreamController<GetIngredientsUseCaseResponse>();
    try {
      final ingredient = await ingredientsRepository.getListIngredients();
      controller.add(GetIngredientsUseCaseResponse(ingredient));
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

/// Wrapping params inside an object makes it easier to change later
class GetIngredientsUseCaseParams {}

/// Wrapping response inside an object makes it easier to change later
class GetIngredientsUseCaseResponse {
  final List<Ingredients> ingredients;

  GetIngredientsUseCaseResponse(this.ingredients);
}
