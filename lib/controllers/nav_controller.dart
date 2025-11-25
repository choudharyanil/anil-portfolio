import 'package:get/get.dart';

class NavController extends GetxController {
  // 0 = Home, 1 = Resume, 2 = Work, 3 = Contact
  final pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
  }
}
