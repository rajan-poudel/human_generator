import 'package:flutter/material.dart';
import 'package:human_generator_app/drawingarea.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DrawingArea> points =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [
                   Color.fromRGBO(136, 35 , 135, 1.0),
                   Color.fromRGBO(255, 64 , 87, 1.0),
                   Color.fromRGBO(242, 113 , 33, 1.0)
               ],
               ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 256,
                    height: 256,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(20),
                     ),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.4),
                         blurRadius: 5.0,
                         spreadRadius: 1
                       ),
                     ]
                    ),
                    child: GestureDetector(
                      onPanDown: (details){
                        this.setState(() {
                          points.add(DrawingArea(
                            point :details.localPosition,
                            areaPaint: Paint()
                            ..strokeCap =StrokeCap.round
                            ..isAntiAlias = true
                            ..color=Colors.white
                            ..strokeWidth = 2.0
                            ),);
                        });
                      },
                     
                      onPanUpdate: (details){
                        this.setState(() {
                          points.add(DrawingArea(
                            point :details.localPosition,
                            areaPaint: Paint()
                            ..strokeCap =StrokeCap.round
                            ..isAntiAlias = true
                            ..color=Colors.white
                            ..strokeWidth = 2.0
                            ),);
                        });
                      },
                       onPanEnd: (details){
                        this.setState(() {
                          points.add(null);
                        });
                      },
                      child: SizedBox.expand(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                            ),
                            child: CustomPaint(
                              painter: MyCustomPainter(points: points),
                            ),
                          ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      
    );
  }
}