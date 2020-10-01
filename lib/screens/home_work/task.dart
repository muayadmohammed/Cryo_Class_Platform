import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:sliding_card/sliding_card.dart';
// import 'sizeConfig.dart';
// import 'AppointmentCard.dart';

class Task extends StatefulWidget {
  TextStyle textStyleTitle, textStyleDes;
  Task({
    @required this.textStyleTitle,
    @required this.textStyleDes,
  });

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {




SlidingCardController controller ;
  @override
  void initState() {
    
    super.initState();
    controller = SlidingCardController();
  }
  






  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool t = true;
    var lista = List.generate(50, (index) => index);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 30,
        itemBuilder: (BuildContext ctxt, int index) {
          return t? AnimatedCard(
            direction: AnimatedCardDirection.left,
            initDelay: Duration(milliseconds: 0),
            duration: Duration(seconds: 1),
            onRemove: () => lista.removeAt(index),
            child: Container(
               color: Colors.grey[300],
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                // Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width - 113,
                                              child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 8, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Subject .....',
                                // style: widget.textStyleDes,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                            

                              Text(
                                '20/2/2021',
                                // style: widget.textStyleDes,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '12:00 AM',
                                // style: widget.textStyleDes,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ):Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          //   AppointmentCard(
          //     onCardTapped: () {
          //       print('Card tapped controller can be used here ');
          //       if(controller.isCardSeparated == true)
          //       {
          //         controller.collapseCard();
          //       }
          //       else
          //       {
          //         controller.expandCard();
          //       }
          //     },
          //     slidingCardController: controller,
          //   )
          ],
        ),
      );
        },
      ),
    );
  }
}
