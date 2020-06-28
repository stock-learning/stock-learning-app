import 'package:flutter/material.dart';

class Loading extends StatelessWidget {

  double percentage;
  bool usePercentage;
  ImageChunkEvent imageChunkEvent;

  Loading({this.percentage = 0, this.imageChunkEvent});
    
  double buildPercentage() {
    if (this.percentage == 0) {
      if (this.imageChunkEvent != null && this.imageChunkEvent.expectedTotalBytes != null) {
        return this.imageChunkEvent.cumulativeBytesLoaded / this.imageChunkEvent.expectedTotalBytes;
      } else {
        return null;
      }
    } else {
      return this.percentage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: this.buildPercentage(),
      ),
    );
  }
}
