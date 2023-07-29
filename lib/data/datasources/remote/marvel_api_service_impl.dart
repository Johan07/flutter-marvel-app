import 'package:dio/dio.dart';
import 'package:marvel_app/utils/extensions/dio_response_extension.dart';

import '../../../domain/models/requests/marvel_characters_request.dart';
import '../../../domain/models/responses/marvel_characters_response.dart';
import '../../../utils/constants/environment.dart';
import 'marvel_api_service.dart';

class MarvelApiServiceImpl implements MarvelApiService {
  final Dio dio;

  MarvelApiServiceImpl(this.dio);

  @override
  Future<Response<MarvelCharactersResponse>> getMarvelCharacters(
    MarvelCharactersRequest request,
  ) async {
    // convert map<String, dynamic> to marvelCharacterresponse using fromJson
    final result = await dio.get(
      kBaseUrl + kAllCharacters,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      ),
      queryParameters: request.toRequestParams(),
    );
    final value = MarvelCharactersResponse.fromJson(
      result.data,
    );
    return result.changeData<MarvelCharactersResponse>(value);
  }
}
