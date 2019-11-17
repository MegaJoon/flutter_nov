import 'package:flutter/material.dart';
import 'package:flutter_nov/1117/select_payment_type_page.dart';

class PaymentApp extends StatefulWidget {
  @override
  _PaymentAppState createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  double padding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout",
          style: TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // orders
            Container(
              height: 300.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Orders", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),),
                  Row(
                    children: <Widget>[
                      Text("Subtotal (4 items)", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                      Spacer(),
                      Text("\$31", style: TextStyle(fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w400),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Coupon discount", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                      Spacer(),
                      Text("-\$5", style: TextStyle(fontSize: 12.0, color: Colors.red, fontWeight: FontWeight.w400),),
                    ],
                  ),

                  Divider(height: 2.0, color: Colors.black54),

                  Row(
                    children: <Widget>[
                      Text("Delivery Charges", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                      Spacer(),
                      Text("+\$3", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w600),),
                    ],
                  ),

                  Divider(height: 2.0, color: Colors.black54),

                  Row(
                    children: <Widget>[
                      Text("Total", style: TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w400),),
                      Spacer(),
                      Text("\$29", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w600),),
                    ],
                  ),

                  SizedBox(height: 32.0),

                  Text("Recipient Details", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),),
                  Text("777 Brockton Avenue, Abington MA 2351.", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                  Text("+1 (404) 960-3807", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                ],
              ),
            ),

            Spacer(),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPaymentTypePage()));
              },
              child: Container(
                height: 64.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.deepPurpleAccent
                ),
                child: Center(
                    child: Text("Proceed & Pay",
                    style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
