class SceneModel {
  final String textAr;
  final String textEn;
  final String? image;

  SceneModel({required this.textAr, required this.textEn, this.image});

  String getText(String lang) => lang == 'ar' ? textAr : textEn;
}

class ScenarioModel {
  final String id;
  final String titleAr;
  final String titleEn;
  final List<SceneModel> scenes;
  final int questionSceneIndex;
  final String mode; // 'lesson', 'test', 'safety'

  ScenarioModel({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.scenes,
    required this.questionSceneIndex,
    this.mode = 'lesson',
  });

  String getTitle(String lang) => lang == 'ar' ? titleAr : titleEn;
}
