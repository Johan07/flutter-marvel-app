
import '../../../utils/constants/environment.dart';

class MarvelCharactersRequest {
  final String publicKey;
  final int limit;
  final int offset;

  MarvelCharactersRequest({
    this.publicKey = kPublicKey,
    this.limit = 100,
    this.offset = 0,
  });

  Map<String, dynamic> toRequestParams() {
    return <String, dynamic>{
      'apikey': publicKey,
      'limit': limit,
      'offset': offset,
      'events': 29, // Only infinity war
      'ts': '1690588815262',
      'hash': 'f13baab2150ee900eb49b0228b34cf12',
    };
  }
}
