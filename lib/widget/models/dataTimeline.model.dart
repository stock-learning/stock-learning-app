class DataTimelineModel {
  String imageURL;
  String name;
  String initials;
  String description;
  double percentage;
  bool isUp;

  DataTimelineModel(this.imageURL, this.name, this.initials, this.description, this.percentage, this.isUp);

  static List<DataTimelineModel> getDataModel() {
    List<DataTimelineModel> model = List<DataTimelineModel>();
    for (var i = 0; i < 5; i++) {
      model.add(DataTimelineModel(
        'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
        'Nome da empresa',
        'NDME',
        'Descrição breve da empresa',
        20.5,
        true,
      ));

      model.add(DataTimelineModel(
        'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
        'Nome da empresa',
        'NDME',
        'Descrição breve da empresa',
        20.5,
        false,
      ));
    }

    return model;
  }
}
