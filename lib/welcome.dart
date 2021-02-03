import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:location_menu_new/widgets/primary_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import 'f.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<String> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE);
    return barcodeScanRes;
  }

  _launchURL(String url) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TransformationController controller = TransformationController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/bg2.png"),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ClipPath(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: 200,
              //     color: Colors.blue,
              //   ),
              //   clipper: CustomClipPath(),
              // ),

              // LogoWidget(),
              Container(
                // height: 60,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'ALMENUQR',
                  style: TextStyle(
                      // color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'beIN',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),

              // SizedBox(
              //   height: 20,
              // ),
              Center(
                child: Container(
                  width: size.width - 90,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/black.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(left: 10),
              //   height: 50,
              //   width: size.width - 90,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(15)),
              //       border: Border.all(
              //           width: 1,
              //           color: Colors.grey,
              //           style: BorderStyle.solid)),
              //   child: PrimaryTextField(
              //     label: "Resturant Search",
              //   ),
              // ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 50,
                    width: size.width - 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          width: 2,
                          color: Colors.grey[300],
                          style: BorderStyle.solid),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: PrimaryTextField(
                            label: "Resturant Search",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: size.height - 180, left: 0),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/search.png"),
                        fit: BoxFit.fill,
                      ),
                      border: Border.all(color: Colors.grey[300], width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        //toodo
                        // var brcode = await scanBarcodeNormal();
                        // print('vccccc : $brcode');
                        // _launchURL(brcode);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.01, 0),
                        child: Text(
                          '',
                          style: TextStyle(
                              // color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'beIN',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: size.height - 180, left: 0),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 236, 216, 1),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // gradient: LinearGradient(
                        //   begin: Alignment.topRight,
                        //   end: Alignment.bottomLeft,
                        //   colors: [
                        //     Color.fromRGBO(255, 236, 216, 1),
                        //     Color.fromRGBO(255, 244, 217, 1),
                        //   ],
                        // ),
                        border: Border.all(
                            style: BorderStyle.solid, color: Colors.white)),
                    //  BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage("assets/images/box.png"),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    child: FlatButton(
                      onPressed: () async {
                        //  _launchURL('https://zebra-qr.com/');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Webview2(
                                url:
                                    'https://zebra-qr.com/new/restaurant/register')));
                        // //toodo
                        // var brcode = await scanBarcodeNormal();
                        // print('vccccc : $brcode');
                        // _launchURL(brcode);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.01, 0),
                        child: Text(
                          'Home',
                          style: TextStyle(
                              // color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'beIN',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: size.height - 180, left: 0),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 236, 216, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      // gradient: LinearGradient(
                      //   begin: Alignment.topRight,
                      //   end: Alignment.bottomLeft,
                      //   colors: [
                      //     Color.fromRGBO(255, 236, 216, 1),
                      //     Color.fromRGBO(255, 233, 16, 1),
                      //   ],
                      // ),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.white),
                    ),
                    //  BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage("assets/images/box.png"),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    child: FlatButton(
                      onPressed: () async {
                        // //toodo
                        var brcode = await scanBarcodeNormal();
                        print('vccccc : $brcode');
                        // _launchURL(brcode);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Webview2(url: brcode)));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.01, 0),
                        child: Text(
                          'Menu Qr ',
                          style: TextStyle(
                              // color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'beIN',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Container(
                              //   padding: EdgeInsets.all(10),
                              // margin: EdgeInsets.only(top: size.height - 180, left: 0),
                              height: 250,
                              //width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/boxorang.png"),
                                  fit: BoxFit.fill,
                                ),
                                //  border: Border.all(color: Colors.grey[300], width: 2),
                                //borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              // child:
                            ),
                          ),
                          Container(
                            height: 160,
                            margin: EdgeInsets.fromLTRB(30, 0, 0, 90),
                            child: Transform.rotate(
                              angle: -0.0,
                              child: InteractiveViewer(
                                transformationController: controller,
                                onInteractionEnd: (ScaleEndDetails endDetails) {
                                  controller.value = Matrix4.identity();
                                },
                                child: new Image.asset(
                                    'assets/images/berger org.png'),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.fromLTRB(250, 40, 10, 90),
                            child: new Image.asset('assets/images/like2.png'),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.fromLTRB(60, 150, 10, 0),
                            child: Text(
                              '#5468 CODE ',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'beIN',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.fromLTRB(60, 180, 10, 0),
                            child: Text(
                              'Cheese Burger ',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'beIN',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topRight,
                              //   end: Alignment.bottomLeft,
                              //   colors: [
                              //     Color.fromRGBO(255, 236, 216, 1),
                              //     Color.fromRGBO(255, 233, 16, 1),
                              //   ],
                              // ),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.white),
                            ),
                            height: 60,
                            margin: EdgeInsets.fromLTRB(240, 180, 10, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'EGP 75',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 173, 87, 1),
                                    fontFamily: 'beIN',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Container(
                              //   padding: EdgeInsets.all(10),
                              // margin: EdgeInsets.only(top: size.height - 180, left: 0),
                              height: 250,
                              //width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/boxgreen.png"),
                                  fit: BoxFit.fill,
                                ),
                                //  border: Border.all(color: Colors.grey[300], width: 2),
                                //borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              // child:
                            ),
                          ),
                          Container(
                            height: 160,
                            margin: EdgeInsets.fromLTRB(30, 0, 0, 90),
                            child: Transform.rotate(
                              angle: -0.0,
                              child: InteractiveViewer(
                                transformationController: controller,
                                onInteractionEnd: (ScaleEndDetails endDetails) {
                                  controller.value = Matrix4.identity();
                                },
                                child: new Image.asset(
                                    'assets/images/berger org.png'),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.fromLTRB(250, 40, 10, 90),
                            child: new Image.asset('assets/images/like2.png'),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.fromLTRB(60, 150, 10, 0),
                            child: Text(
                              '#78545 CODE',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'beIN',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.fromLTRB(60, 180, 10, 0),
                            child: Text(
                              'Spicy Burger',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'beIN',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topRight,
                              //   end: Alignment.bottomLeft,
                              //   colors: [
                              //     Color.fromRGBO(255, 236, 216, 1),
                              //     Color.fromRGBO(255, 233, 16, 1),
                              //   ],
                              // ),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.white),
                            ),
                            height: 60,
                            margin: EdgeInsets.fromLTRB(240, 180, 10, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'EGP 65',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 211, 130, 1),
                                    fontFamily: 'beIN',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.01, 0),
              //   child: Text(
              //     'Resturant',
              //     style: TextStyle(
              //         // color: Color.fromRGBO(255, 255, 255, 1),
              //         fontFamily: 'beIN',
              //         fontWeight: FontWeight.bold,
              //         fontSize: 14),
              //   ),
              // ),

              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   // margin: EdgeInsets.only(top: size.height - 180, left: 0),
              //   height: 50,
              //   width: 150,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/box.png"),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              //   child: FlatButton(
              //     onPressed: () async {
              //       //toodo
              //       var brcode = await scanBarcodeNormal();
              //       print('vccccc : $brcode');
              //       _launchURL(brcode);
              //     },
              //     child: Container(
              //       margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.01, 0),
              //       child: Text(
              //         'Qr Scan ',
              //         style: TextStyle(
              //             // color: Color.fromRGBO(255, 255, 255, 1),
              //             fontFamily: 'beIN',
              //             fontWeight: FontWeight.bold,
              //             fontSize: 14),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   height: 50,
              //   width: 150,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/box.png"),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              //   child: FlatButton(
              //     onPressed: () {
              //       //toodo
              //     },
              //     child: Container(
              //       margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.01, 0),
              //       child: Text(
              //         'Search By Name ',
              //         style: TextStyle(
              //             //   color: Color.fromRGBO(255, 255, 255, 1),
              //             fontFamily: 'beIN',
              //             fontWeight: FontWeight.bold,
              //             fontSize: 14),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Webview2 extends StatefulWidget {
  String url;
  Webview2({this.url}); // : super(key: key);

  @override
  _Webview2State createState() => _Webview2State();
}

class _Webview2State extends State<Webview2> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}
