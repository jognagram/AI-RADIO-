import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_techno/model/radio.dart';
import 'package:salon_techno/utils/ia_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class AiPage extends StatefulWidget {
  @override
  _AiPageState createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  List<MyRadio> radio;
  @override
  void initState() {
    super.initState();
    fetchRadio();
  }

  fetchRadio() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radio = MyRadioList.fromJson(radioJson).radio;
    print(radio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(
                colors: [IAColors.primaryColor1, IAColors.primaryColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ))
              .make(),
          AppBar(
            title: "IA Radio".text.xl4.bold.white.make().shimmer(
                  primaryColor: Vx.purple500,
                  secondaryColor: Colors.white,
                ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100.0).p16()
        ],
      ),
    );
  }
}
