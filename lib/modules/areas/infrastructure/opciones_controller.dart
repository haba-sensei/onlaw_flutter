import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/menu_content_provider.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/areas/widgets/attach_sheet.dart';
import 'package:onlaw/modules/areas/widgets/detalle_sheet.dart';
import 'package:onlaw/modules/areas/widgets/imagen_sheet.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/shared/domain/attach_model.dart';
import 'package:onlaw/shared/domain/images_model.dart';
import 'package:get/get.dart';

class OpcionesController extends GetxController {
  final SharedPref _sharedPref = SharedPref();
  UsersProvider usersProvider = UsersProvider();
  MenuContentProvider menuContentProvider = MenuContentProvider();
  UserModel? user = UserModel();
  List<ImagesModel> images = [];
  List<AttachModel> attachs = [];

  @override
  void onInit() async {
    user = UserModel.fromJson(await _sharedPref.read('user'));
    usersProvider.onInit();
    menuContentProvider.onInit();
    update();
    super.onInit();
  }

  detalles(String detalle) {
    Get.bottomSheet(DetalleSheet(text: detalle));
  }

  listImages(String nivel, String id) async {
    images = await menuContentProvider.getImages(nivel, id);
    Get.bottomSheet(ListImages(images: images));
  }

  listAttachs(String nivel, String id) async {
    attachs = await menuContentProvider.getAttachs(nivel, id);

    Get.bottomSheet(ListAttachs(
      attachs: attachs,
    ));
  }
}
