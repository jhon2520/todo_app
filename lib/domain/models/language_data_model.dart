class LanguageDataModel {
  final String flag;
  final String name;
  final String languageCode;

  LanguageDataModel(this.flag, this.name, this.languageCode);

  static List<LanguageDataModel> languageList() {
    return <LanguageDataModel>[
      LanguageDataModel("🇺🇸", "English", 'en'),
      LanguageDataModel("col", "Spanish", 'es'),
    ];
  }
}