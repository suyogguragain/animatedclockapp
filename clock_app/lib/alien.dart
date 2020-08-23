
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Space1Screen extends StatefulWidget {
  @override
  _Space1ScreenState createState() => _Space1ScreenState();
}

class _Space1ScreenState extends State<Space1Screen> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;

  _currentTime(){
    return "${DateTime.now().hour} : ${DateTime.now().minute}";
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
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
          padding: const EdgeInsets.only(left: 108.0),
          child: Text('Alien',style: TextStyle(
            fontSize: 30.0,
              fontFamily: 'Berlin'
          ),),
        ),
        backgroundColor: Colors.lightGreen,
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
            image: ExactAssetImage('images/5286227ea8ba97f7c2f3e7cd3284b53b.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(30.0),
                elevation: 10.0,
                color: Colors.lightGreen,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Colors.green,
                          width: 10.0
                      ),
                  ),

                  width: 320,
                  height: 150,
                  child: Center(
                    child: Text(_currentTime(),style: TextStyle(
                        fontSize: 80.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Transform(
                alignment: FractionalOffset(0.5,0.1),
                transform: Matrix4.rotationZ(animation.value),
                child: Container(
                  child: Image.asset('images/alien.png',width: 300,height: 280,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
