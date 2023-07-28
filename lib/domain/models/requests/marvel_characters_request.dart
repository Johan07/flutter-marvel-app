
import 'package:marvel_app/utils/constants/environment.dart';

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
}
