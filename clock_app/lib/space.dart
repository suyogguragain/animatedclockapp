
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaceScreen extends StatefulWidget {
  @override
  _SpaceScreenState createState() => _SpaceScreenState();
}

class _SpaceScreenState extends State<SpaceScreen> with SingleTickerProviderStateMixin {

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
          padding: const EdgeInsets.only(left: 78.0),
          child: Text('Space',style: TextStyle(
            fontSize: 30.0,
              fontFamily: 'Berlin'
          ),),
        ),
        backgroundColor: Colors.black,
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
            image: ExactAssetImage('images/space.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(30.0),
                elevation: 10.0,
                color: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Colors.black,
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
                  child: Image.asset('images/ast.png',width: 300,height: 280,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
