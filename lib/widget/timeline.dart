import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/DataTimeline.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              'Atualizado em 20:00',
              style: TextStyle(color: Colors.blueGrey[300]),
            )
          ]),
          Expanded(
            child: ListView(
              children: <Widget>[
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: true,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: false,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: true,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: false,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: true,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: false,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: true,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: false,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: true,
                ),
                DataTimeline(
                  imageURL: 'https://sjcdh.rs.gov.br/themes/modelo-noticias/images/outros/TH_imgSemImagem.png',
                  name: 'Nome da empresa',
                  initials: 'NDME',
                  description: 'Descrição breve da empresa',
                  percentage: 20.5,
                  isUp: false,
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
