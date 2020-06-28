import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/loading.dart';

class CompanyLogo extends StatelessWidget {

  final String url;
  final double height;
  final double width;

  CompanyLogo({ this.url, this.height = 256, this.width = 256 }):
    assert(url != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: Align(
        alignment: Alignment.center,
        child: Image.network(
          this.url,
          loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Loading(imageChunkEvent: loadingProgress);
          }
        )
      )
    );
  }
}
