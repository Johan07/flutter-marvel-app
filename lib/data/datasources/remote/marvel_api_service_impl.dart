import 'package:dio/dio.dart';
import 'package:marvel_app/utils/extensions/dio_response_extension.dart';

import '../../../domain/models/requests/marvel_characters_request.dart';
import '../../../domain/models/responses/marvel_characters_response.dart';
import '../../../utils/constants/environment.dart';
import '../../../utils/generate_md5.dart';
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
      queryParameters: {
        ...request.toRequestParams(),
        ..._getAuthenticationParams(request.privateKey, request.publicKey),
      },
    );
    final value = MarvelCharactersResponse.fromJson(
      result.data,
    );
    return result.changeData<MarvelCharactersResponse>(value);
  }

  Map<String, dynamic> _getAuthenticationParams(
    String privateKey,
    String publicKey,
  ) {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final Md5Generator md5Generator = Md5Generator();

    return <String, dynamic>{
      'ts': ts,
      'hash': md5Generator('$ts$privateKey$publicKey'),
    };
  }
}
