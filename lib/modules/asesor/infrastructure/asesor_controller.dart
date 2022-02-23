import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/chats_provider.dart';
import 'package:onlaw/data/provider/menu_content_provider.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/asesor/domain/solicitud_model.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

class AsesorController extends GetxController {
  final SharedPref _sharedPref = SharedPref();
  UsersProvider usersProvider = UsersProvider();
  ChatsProvider chatsProvider = ChatsProvider();
  MenuContentProvider menuContentProvider = MenuContentProvider();
  UserModel? user = UserModel();
  SolicitudModel? solicitud = SolicitudModel();
  List<SolicitudModel> solicitudes = [];
  List<MenuContentModel> area = [];

  @override
  void onInit() async {
    user = UserModel.fromJson(await _sharedPref.read('user'));
    usersProvider.onInit();
    chatsProvider.onInit();
    menuContentProvider.onInit();

    update();
    super.onInit();
  }

  @override
  void onReady() {
    listMyChats();
    listArea();
    super.onReady();
  }

  listMyChats() async {
    solicitudes = await chatsProvider.getChats();
    update();
  }

  listArea() async {
    area = await menuContentProvider.getAreas();

    update();
  }

  solicitar(String idEsp) async {
    solicitud = await chatsProvider.solicitud(idEsp);
    listMyChats();
  }
}
