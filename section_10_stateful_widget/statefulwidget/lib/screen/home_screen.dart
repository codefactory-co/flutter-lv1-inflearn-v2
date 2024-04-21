import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('build 실행!');

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                if(color == Colors.blue){
                  color = Colors.red;
                }else{
                  color = Colors.blue;
                }

                print('색상 변경: color: $color');

                setState((){});
              },
              child: Text(
                '색상 변경!',
              ),
            ),
            SizedBox(height: 32.0),
            Container(
              width: 50.0,
              height: 50.0,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
