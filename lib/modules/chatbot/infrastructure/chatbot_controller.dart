import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/chatbot_provider.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';
 
class ChatbotController extends GetxController {
  final SharedPref _sharedPref = SharedPref();
  UsersProvider usersProvider = UsersProvider();
  ChatbotProvider chatbotProvider = ChatbotProvider();
  UserModel? user = UserModel();
  List<MenuContentModel> contentChat = [];
 
  @override
  void onInit() async {
    user = UserModel.fromJson(await _sharedPref.read('user'));
    usersProvider.onInit();
    chatbotProvider.onInit();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    consultMenu('0', '1', '-1');
    super.onReady();
  }

  consultMenu(String message, String nivel, String zonaId) async {
    contentChat = await chatbotProvider.getContentChatbot(message, nivel, zonaId);
    update();
  }

  
}
