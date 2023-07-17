import 'package:flutter/material.dart';
import 'package:task_app/presentation/screens/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/enums/index.dart';
import 'package:task_app/utils/localizations_utils/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        

        body: Container(
          
          margin: const EdgeInsets.all(30),
          child: Center(
            child: Column(


              


              
              children:[

                const CustomSpacer(spacerEnum: SpacerEnum.spacingS,),
                const CustomSelectionLanguage(),


Text(Languages
              .of(context)
              .appName),

      
                Text(
                  Languages
                      .of(context)
                      .labelWelcome,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                  textAlign: TextAlign.center,

                ),
          
              ],
            ),
          ),
        ),
      );
}


