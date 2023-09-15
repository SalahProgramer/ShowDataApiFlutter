import 'package:apiapplication/model/user.dart';
import 'package:apiapplication/model/user_name.dart';

class user {
  username name;
  String gender;
  String email;
  String phone;
  String cell;
  String nat;
  pictur picture;
  user({
    required this.name,
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.picture
  });
}


class pictur{


  String thumbnail;
  pictur({

   required this.thumbnail


});
}

