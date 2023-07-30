import 'package:flutter/material.dart';
import 'package:task_app/presentation/screens/home_screen/widgets/index.dart';
import 'package:task_app/presentation/screens/new_task_screen.dart/widgets/index.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            FormNewTask(),
      
      
      

      
      
          ],
        ),
      )
    );
  }
}

          //  Positioned(
          //       bottom: 0,
          //       left: 0,
          //       child: Container(
          //         alignment: Alignment.topCenter,
          //         height: size.height * 0.2,
          //         width: size.width,
          //         // color: Colors.red,
          //         child: CustomPaint(
          //           painter: CustomPaintedCurve(),
          //           child: Container(
          //           ) ,
          //         ),
                  
          //       ),
          //     )