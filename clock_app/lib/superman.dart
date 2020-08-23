

import 'package:flutter/material.dart';

class SupermanScreen extends StatefulWidget {
  @override
  _SupermanScreenState createState() => _SupermanScreenState();
}

class _SupermanScreenState extends State<SupermanScreen> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;

  _currentTime(){
    return "${DateTime.now().hour} : ${DateTime.now().minute}";
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    animationController.addListener((){

      if(animationController.isCompleted){
        animationController.reverse();
      } else if(animationController.isDismissed){
        animationController.forward();
      }
      setState(() {

      });
    });
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {

    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5,end: 0.5).animate(animation);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 58.0),
          child: Text('Superman',style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Berlin'
          ),),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('images/comic.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(30.0),
                elevation: 10.0,
                color: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Colors.lightBlueAccent,
                          width: 10.0
                      )
                  ),
                  width: 320,
                  height: 170,
                  child: Center(
                    child: Text(_currentTime(),style: TextStyle(
                        fontSize: 80.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              Transform(
                alignment: FractionalOffset(0.5,0.1),
                transform: Matrix4.rotationZ(animation.value),
                child: Container(
                  child: Image.asset('images/super.png',width: 300,height: 380,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
