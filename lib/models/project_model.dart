class Project {
  final String title;
  final String description;
  final String? duration;
  final String image; // local asset or network
  final String? playStore;
  final String? appStore;
  final String category; // app / web / design
  final String? projectCategory; // app / web / design

  Project({
    required this.title,
    required this.description,
     this.duration,
    required this.image,
    this.playStore,
    this.appStore,
    required this.category,
    this.projectCategory
  });
}
