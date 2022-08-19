import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constant.dart';

enum Detector {
  shuffi,
  repeat,
}

class Screandisign extends StatefulWidget {
  @override
  State<Screandisign> createState() => _sScreandisignState();
}

class _sScreandisignState extends State<Screandisign> {
  Color shufferactive = activechord;
  Color repeateractive = activechord;
  int selectvale = 30;

  void changecolor(Detector detector) {
    if (detector == Detector.shuffi) {
      if (shufferactive == activechord) {
        shufferactive = inactivechord;
      } else
        shufferactive = activechord;
    }
    if (detector == Detector.repeat) {
      if (repeateractive == activechord) {
        repeateractive = inactivechord;
      } else {
        repeateractive = activechord;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x1F1F1F),
        title: Text('music player'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Expanded(
              child: Container(
                child: Image.asset(
                    'images/3d-illustration-musical-notes-signs-260nw-761313844.jpg.webp',
                      width:440,
                      height: 210,
                ),
                
              ),
    ),
          ),
            Expanded(
            child: InputContainer(
              color: Color(0xff474747),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Track title',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Artist',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Slider(
                      activeColor: Color(0xffF0052C),
                      inactiveColor: Color(0xffFFFFFF),
                      value: selectvale.truncateToDouble(),
                      min: 0,
                      max: 100,
                      divisions: 100,
                      onChanged: (double newvalue) {
                        setState(() {
                          print(newvalue);
                          selectvale = newvalue.round();
                        });
                      }),
                  Text('Valume  ' + selectvale.toString()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changecolor(Detector.shuffi);
                      });
                    },
                    child: Expanded(
                      child: InputContainer(
                        child: IconsData(
                          icon: Icons.shuffle_rounded,
                          namevalue: 'SHUFFLE',
                        ),
                        color: shufferactive,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changecolor(Detector.repeat);
                      });
                    },
                    child: Expanded(
                      child: InputContainer(
                        child: IconsData(
                          icon: Icons.repeat_rounded,
                          namevalue: 'REPEATER',
                        ),
                        color: repeateractive,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  final Color? color;
  final Widget? child;

  InputContainer({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class IconsData extends StatelessWidget {
  IconData? icon;

  String? namevalue;

  IconsData({this.icon, this.namevalue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        Text(
          namevalue!,
          style: namevaluestyle,
        ),
      ],
    );
  }
}
