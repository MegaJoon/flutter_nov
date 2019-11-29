import 'package:flutter/material.dart';

// https://dribbble.com/shots/8580188-Medical-app/attachments/845968?mode=media

class MedicalApp extends StatefulWidget {
  @override
  _MedicalAppState createState() => _MedicalAppState();
}

class _MedicalAppState extends State<MedicalApp> {
  // color list
  Color _color = Color.fromRGBO(121, 199, 153, 1);
  Color _color2 = Color.fromRGBO(73, 167, 157, 1);

  double padding = 16.0;

  // text
  // title
  String title = "Good Morning!";
  String subTitle = "Eugenia Burke!";

  // doctor
  String _doctorName = "Dr. Mourice Tyler";
  String _doctorDepartment = "Physiotherapy";
  String _doctorHi = "Hi. Eugenio. you can find the first examination\nreport here. And please check our next meet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background gradient color
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_color, _color2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // appbar
          Positioned(
              top: padding,
              left: padding,
              right: padding,
              child: SafeArea(
                top: true,
                left: true,
                right: true,
                child: Container(
                  height: 48.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title,
                      style: TextStyle(
                        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                      ),
                      ),

                      Text(subTitle,
                        style: TextStyle(
                          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),

          // left binder ring shadow
          Positioned(
            right: padding *4.0,
            bottom: 210.0,
            child: ClipPath(
              clipper: myClipper(),
              child: Container(
                height: 30.0,
                width: 25.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          // right binder ring shadow
          Positioned(
            left: padding *5.7,
            bottom: 210.0,
            child: ClipPath(
              clipper: myClipper(),
              child: Container(
                height: 30.0,
                width: 25.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          // top container
          Positioned(
            top: 100.0,
            left: padding,
            right: padding,
            child: Container(
              height: 350.0,
              child: Stack(
                children: <Widget>[
                  // main
                  Positioned(
                    top: padding,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // name
                          Text(_doctorName,
                          style: TextStyle(
                            fontSize: 16.0, color: _color2, fontWeight: FontWeight.w600,
                          ),
                          ),

                          // department
                          Text(_doctorDepartment.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                            ),
                          ),

                          // text
                          Text(_doctorHi,
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.black12, fontWeight: FontWeight.w600,
                            ),
                          ),

                          // container
                          Container(
                            height: 170.0,
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: padding,
                                  childAspectRatio: 2.2
                                ),
                                itemCount: 4,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index){
                                  return Container(
                                    padding: EdgeInsets.symmetric(horizontal: padding *0.50),
                                    margin: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                      )],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        // icon
                                        Icon(medicalList[index].icon, size: 24.0, color: medicalList[index].color),

                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(medicalList[index].data,
                                          style: TextStyle(
                                            fontSize: 20.0, color: Colors.lightBlue, fontWeight: FontWeight.w600,
                                          ),
                                          ),
                                        ),

                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(medicalList[index].text.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                          // checkcomplete report
                          Align(
                            alignment: Alignment.center,
                            child: Text("Check Complete Report",
                            style: TextStyle(
                              fontSize: 14.0, color: Colors.lightBlue, fontWeight: FontWeight.w600,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // profile image
                  Positioned(
                    top: 0,
                    right: padding,
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                          image: NetworkImage("https://cdn.pixabay.com/photo/2017/03/22/19/07/ambulance-2166079__340.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
//                      child: Placeholder(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // bottom container
          Positioned(
            left: padding,
            right: padding,
            bottom: padding,
            child: Container(
              padding: EdgeInsets.all(padding),
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  // text, image
                  Positioned.fill(
                      child: Column(
                        children: <Widget>[
                          Text("Physical Examination",
                          style: TextStyle(
                            fontSize: 14.0, color: _color2, fontWeight: FontWeight.w600,
                          ),
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              child: Image.asset("assets/shoulder_muscle.png", fit: BoxFit.fill),
                          ),
                        ],
                      ),
                  ),

                  // center icon
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        height: 32.0,
                        width: 150.0,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: Colors.white,
                          shadows: [BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 1,
                          )],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Shoulder muscle".toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                            ),
                            ),

                            Icon(Icons.remove_circle, size: 12.0, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // bottomLeft icon
                  Positioned(
                    left: padding,
                    bottom: padding,
                    child: Container(
                      height: 48.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: _color2,
                      ),
                      child: Center(
                          child: Icon(Icons.insert_drive_file, size: 24.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // left binder image
          Positioned(
            left: padding *3,
            bottom: 150.0,
            child: Container(
              height: 150.0,
              width: 100.0,
              child: Image.asset("assets/binder_ring.png", fit: BoxFit.cover),
            ),
          ),

          // right binder image
          Positioned(
            right: padding *2,
            bottom: 150.0,
            child: Container(
              height: 150.0,
              width: 100.0,
              child: Image.asset("assets/binder_ring.png", fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class myClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path()
    ..lineTo(0.0, 0.0)
    ..quadraticBezierTo(size.width *0.25, size.height *0.50, 0.0, size.height)
    ..lineTo(size.width *0.25, size.height)
    ..quadraticBezierTo(size.width * 0.50, size.height * 0.50, size.width * 0.25, 0.0)
    ..lineTo(size.width * 0.25, 0.0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MedicalList {
  IconData icon;
  Color color;
  String data;
  String text;

  MedicalList({this.icon, this.color, this.data, this.text});
}

List<MedicalList> medicalList = [
  MedicalList(icon: Icons.favorite, color: Colors.red, data: "86", text: "Blood Rate"),
  MedicalList(icon: Icons.local_dining, color: Colors.orange, data: "122 / 86", text: "Blood pressure"),
  MedicalList(icon: Icons.wb_sunny, color: Colors.indigo, data: "217", text: "Cholestrol"),
  MedicalList(icon: Icons.toys, color: Colors.deepPurple, data: "145", text: "Blood sugar"),
];











