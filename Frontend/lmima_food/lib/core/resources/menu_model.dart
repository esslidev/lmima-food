class MenuModel {
  String title;
  String icon;
  List<SubMenuModel>? subMenu;
  MenuModel({required this.title, required this.icon, this.subMenu});
}

class SubMenuModel {
  String title;
  SubMenuModel({required this.title});
}
