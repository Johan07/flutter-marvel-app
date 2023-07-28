
import '../../../utils/constants/environment.dart';

class MarvelCharactersRequest {
  final String publicKey;
  final String privateKey;
  final int limit;
  final int offset;

  MarvelCharactersRequest({
    this.publicKey = kPublicKey,
    this.privateKey = kPrivateKey,
    this.limit = 20,
    this.offset = 0,
  });

  Map<String, dynamic> toRequestParams() {
    return <String, dynamic>{
      'apiKey': publicKey,
      'limit': limit,
      'offset': offset,
    };
  }
}
