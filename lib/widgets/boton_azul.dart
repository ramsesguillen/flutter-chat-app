///[]
import 'package:flutter/material.dart';


///[]


///[]
class BotonAzul extends StatelessWidget {

  final String text;
  final Function onPress;

  const BotonAzul({
    Key key,
    @required this.text,
    @required this.onPress
  }) : super(key: key);

///[]
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      ),
      onPressed: this.onPress,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(text, style: TextStyle( color: Colors.white, fontSize: 18 )),
        ),
      ),
    );
  }
}
