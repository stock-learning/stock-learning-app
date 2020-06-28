import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class DescriptionText extends StatefulWidget {

  final String text;
  final int characterLimit;
  final String showMoreLabel;
  final String showLessLabel;

  DescriptionText({
    this.text,
    this.characterLimit = 500,
    this.showMoreLabel = 'Mostrar mais',
    this.showLessLabel = 'Mostrar menos'
  }):
    assert(text != null);

  DescriptionTextState createState() => new DescriptionTextState();

}

class DescriptionTextState extends State<DescriptionText> {

  bool showMoreActive;
  bool showMoreOrLessLabelVisible;

  @override
  void initState() {
    super.initState();
    this.showMoreOrLessLabelVisible = widget.text.length > widget.characterLimit;
    this.showMoreActive = false;
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    children.add(this.buildRichTextWidget());
    if (this.showMoreOrLessLabelVisible) {
      children.add(this.buildShowMoreOrLessLabel());
    }
    return Container(
      child: Column(
        children: children,
      ),
    );
  }

  Widget buildRichTextWidget() {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        text: this.getText()
      ),
      strutStyle: StrutStyle(fontSize: 20.0),
      textAlign: TextAlign.justify,
    );
  }

  Widget buildShowMoreOrLessLabel() {
    return InkWell(
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          !this.showMoreActive ? widget.showMoreLabel : widget.showLessLabel,
          style: TextStyle(color: primaryColor),
        ),
      ),
      onTap: () {
        setState(() {
          this.showMoreActive = !this.showMoreActive;
        });
      },
    );
  }

  String getText() {
    if (!this.showMoreOrLessLabelVisible || this.showMoreActive) {
      return widget.text;
    } else {
      return widget.text.substring(0, widget.characterLimit) + '...';
    }
  }
  
}
