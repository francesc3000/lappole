import 'package:lappole/src/dao/club_dao.dart';
import 'package:lappole/src/model/club.dart';

class ClubDaoImpl implements ClubDao {
  @override
  Future<Club?> getClubByPassword(String password) {
    Map<String, Club> clubes = {
      'abc': Club(id: '512', name: 'El Mejor'),
      'abcd': Club(id: '513', name: 'La Mejor'),
      'abcde': Club(id: '514', name: 'Los Mejores'),
    };

    return Future.value(clubes[password]);
  }
}
