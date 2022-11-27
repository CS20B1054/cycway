import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'dart:async';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io' show Platform, sleep;
import 'package:firebase_database/firebase_database.dart';
import'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: cycwaym(),
    debugShowCheckedModeBanner: false,
  )
  );
}

final db= FirebaseDatabase.instance.reference();
Timer? timerd;
GoogleSignInAccount? data;
bool lostsat = false;
GoogleSignIn stats = GoogleSignIn();
String nr='default';
int xo=0;
String nrr='default';
String cyc="default";
String cnt="hi";
double cred=0;
String vdno="default";
String endda="default";
String k="0";
String l="0";
int cn=10;
String daa="default";
double cost =0;
String bar="default";
int h=0;
int seconds = 0;
String name='default';
bool boss=true;
int te=1;
int ebar=0;
String barcode = "default";
void stoptimer(){
  timerd?.cancel();
}
void cash(){
  cost=seconds/10;
}
class cycwaym extends StatefulWidget {

  const cycwaym({Key? key}) : super(key: key);

  @override
  State<cycwaym> createState() => _cycwaymState();
}

class _cycwaymState extends State<cycwaym> {
  final Future<FirebaseApp> _fbapp = Firebase.initializeApp();
  PageController page = PageController(initialPage: 0);



  @override




  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: lostsat
              ? home()
              : Stack(
              children : [
                Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Color(0xff69d8d5),
                          Color(0xff69d8d5),
                          Color(0xffcc5ed0),
                          Color(0xffcc5ed0),


                        ],

                        begin: FractionalOffset.topRight,
                        end: FractionalOffset.bottomLeft,
                      )
                  ),
                  child: Stack(

                    children: [
                      Align(
                          alignment: Alignment(0.0,-0.6),
                          child: CircleAvatar(radius: 200,backgroundColor: Color(
                              0xFF069D8F),
                            child: ClipOval(
                              child: Image.asset("assets/logonew.jpeg"),
                            ),


                          )
                      ),
                      // Align(
                      //     alignment: Alignment(0.0,0.0),
                      //     child:Text('Cycway',style:TextStyle(color:Color(),fontSize: 60,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,shadows: <Shadow>[
                      //       Shadow(
                      //         offset: Offset(-1.0, 0.0),
                      //         blurRadius: 3.0,
                      //         color: Colors.white60,
                      //       ),
                      //       Shadow(
                      //         offset: Offset(-1.0, 0.0),
                      //         blurRadius: 8.0,
                      //         color: Colors.white38,
                      //       ),
                      //     ],),)
                      // ),
                      Align(
                        alignment: Alignment(0.0,0.91),
                        child: Text("made by team seismo",style: TextStyle(color: Colors.black87,fontSize: 20),),
                      ),


                      Align(
                        alignment: Alignment(0.0,0.75),
                        child: ConfirmationSlider(
                            text: "slide to get started",
                            textStyle: TextStyle(color: Colors.white70,fontSize: 20),
                            foregroundColor: Color(0xFF69D8D5),
                            backgroundColor: Colors.black,
                            onConfirmation:(){
                              HapticFeedback.heavyImpact();
                              try{
                              stats.signIn().then((userdata){
                                setState(() {

                                  data=userdata;
                                  lostsat=true;
                                });
                              });
                            }
                        catch(e){}}),
                      )

                    ],
                  ),
                )
              ]
          ),
        )

    );}
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    _activelisten();
  }
  // final db= FirebaseDatabase.instance.reference();
  String da=data!.displayName.toString().replaceAll(new RegExp(r'[^\w\s]+'),'');

  _activelisten(){
    db.child("users/$da/credit").onValue.listen((event) {
      final String cred1 = event.snapshot.value.toString();
      setState(() {
        cred=double.parse(cred1);
        daa=da;
        print("hiii  $daa");
      });
    });

  }
  PageController page = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffa14ca5),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
            Color(0xff69d8d5),
        Color(0xff69d8d5),
        Color(0xffcc5ed0),
        Color(0xffcc5ed0),


        ],

      begin: FractionalOffset.topRight,
      end: FractionalOffset.bottomLeft,
      )
    ) , accountName: Text(data!.displayName.toString()), accountEmail: Text(data!.email.toString()),currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(data!.photoUrl.toString()),
              ),
            ),),
            TextButton.icon(icon:FaIcon(FontAwesomeIcons.google,color: Colors.black26,size: 30,),
                label: Text(" logout",style: TextStyle(fontSize: 20,color: Color(0xffa14ca5)),),
                style: TextButton.styleFrom(
                    onSurface: Colors.white,primary: Colors.black),onPressed: (){
                  stats.signOut().then((userdata){
                    setState(() {
                      lostsat=false;
                    });
                  });
                  setState(() {
                    lostsat=false;
                  });
                  setState(() {
                    cred=0;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const cycwaym()));
                }),
          ],
        ),
      ),
      appBar: AppBar(backgroundColor:  Color(0xffa14ca5),
        elevation: 30,
        title: Text("Cycway"),

      ),
      body: PageView(
        controller: page,
        children: [
          Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    Color(0xffcc5ed0),
                    Color(0xffcc5ed0),
                    Color(0xff69d8d5),
                    Color(0xff69d8d5),


                  ],

                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                )
            ),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment(0.0,-0.7),

                    child: CircleAvatar(radius: 53,backgroundColor: Color(0xffa14ca5),
                      child: ClipOval(
                        child: Image.network(data!.photoUrl.toString(),fit: BoxFit.fill,),
                      ),


                    )

                ),
                Align(
                    alignment: Alignment(0.0,-0.25),
                    child: Text(data!.displayName.toString().replaceAll(new RegExp(r'[^\w\s]+'),''),style: TextStyle(fontSize: 20,color:Color(
                        0xfff1eeee)),)

                ),
                Align(
                    alignment: Alignment(-0.6,-0.05),
                    child: Text("wallet: ",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold))

                ),
                Align(
                    alignment: Alignment(0.0,0.2),

                    child:Container( height : 100,width: 300,padding: EdgeInsets.all(20),decoration: BoxDecoration(color: Color(0xffa14ca5),borderRadius: BorderRadius.circular(12)),
                        child:Column(children:[
                          Align(alignment: Alignment(-0.8,-0.3),
                              child:Text("Balance credits : ",style: TextStyle(fontSize: 20,color: Color(
                                  0xffded8de)))),
                          Align(alignment: Alignment(0.6,-0.35),
                              child:Text(cred.toStringAsFixed(2),style: TextStyle(fontSize: 20,color: Color(
                                  0xffa9a1aa))))

                        ],)

                    )),

                Align(
                    alignment: Alignment(0.0,0.8),

                    child:Container(alignment: Alignment(0.0,0.8), height:100,width:325,padding: EdgeInsets.all(25),decoration: BoxDecoration(color: Color(0xffa14ca5),borderRadius: BorderRadius.circular(50)),
                        child:Column(children:[
                          Align(alignment: Alignment(-0.0,0.3),
                              child:SizedBox(
                                height: 50,
                                width: 200,

                                child: TextButton(child: Text("Rent a cycle",style: TextStyle(color: Colors.black,fontSize: 20)),style:TextButton.styleFrom(backgroundColor: Color(
                                    0xFF07C4C3),shape: RoundedRectangleBorder(borderRadius: BorderRadius. circular(30.0))),
                                  onPressed:(){
                                    if(cred>5){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => _QRScanPage()),
                                      );}else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("Insufficient balance please consider recharging :)"),
                                      ));
                                    }
                                  },

                                ),
                              )

                          )],)


                    )),
              ],
            ),
          )

        ],
      ),
    );
  }
}
class rent extends StatefulWidget {
  const rent({Key? key}) : super(key: key);

  @override
  State<rent> createState() => _rentState();
}

class _rentState extends State<rent> {
  @override
  void initState() {
    super.initState();
    _activelisten();


  }

  _activelisten(){
    db.child("cycles/$bar/rides").onValue.listen((event) {
      final String rides = event.snapshot.value.toString();
      setState(() {
        nr=rides;

      });
    });
    db.child("cycles/$bar/location").onValue.listen((event) {
      final String rides = event.snapshot.value.toString();
      setState(() {
        nrr=rides;
        print("hi $nrr");
        _activelisten1();
      });
    });


  }
  _activelisten1() {
    db.child("Location/$nrr/count/cycCnt").onValue.listen((event) {
      final String cred1 = event.snapshot.value.toString();
      setState(() {
        print("iii $cred1");
        cn = int.parse(cred1);

        cn = cn - 1;
      });
    });
  }
  @override
  PageController page = PageController(initialPage: 0);

  Widget build(BuildContext context) {
    void timer(){
      timerd=Timer.periodic(Duration(seconds: 1),(timerd){setState(() =>seconds++);
      });}

    var dbb=db.child('users');
    var dbs=db.child('cycles/$bar');
    var dbbb=db.child('Location');
    return Scaffold(
      body: PageView(
          controller: page,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              child:Stack(
                children:[
                  Container(
                    decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [
                            Color(0xFF69D8D5),
                            Color(0xFF701ebd)

                          ],

                          begin: FractionalOffset.topRight,
                          end: FractionalOffset.bottomLeft,
                        )
                    ),),
                  Align(
                      alignment: Alignment(0.0,-0.7),

                      child: Text("Hey , \n\t${data!.displayName.toString()}",style: TextStyle(fontSize: 30,color: Colors.white),)

                  ),

                  Align(
                      alignment: Alignment(0.0,-0.4),

                      child: Text("you are validated\nenjoy your ride :)",style: TextStyle(fontSize: 30,color: Colors.white),)

                  ),

                  Align(
                    alignment: Alignment(0.0,0.5),
                    child: ConfirmationSlider(
                        text: "security guard should slide it",
                        textStyle: TextStyle(color: Colors.white70,fontSize: 15),
                        foregroundColor: Color(0xFF69D8D5),
                        backgroundColor: Colors.black,
                        onConfirmation:()=>{



                          dbs.set({"rides":int.parse(nr)+1,"lastride":data!.displayName.toString().replaceAll(new RegExp(r'[^\w\s]+'),''),"location":nrr}),
                          dbbb.update({"$nrr/count/cycCnt":cn}),
                          timer(),


                          page.jumpToPage(1)
                        }),


                  ),

                ],

              ),

            ),new WillPopScope(
                onWillPop: () async => false,
                child:
                Scaffold(
                  resizeToAvoidBottomInset: false,

                  body: Stack(
                    children:[
                      Container(

                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [

                                Color(0xFF69D8D5),Colors.black45,
                              ],

                              begin: FractionalOffset.topRight,
                              end: FractionalOffset.bottomLeft,
                            )
                        ),),
                      Align(
                          alignment: Alignment(-0.6,-0.7),
                          child: Text("your cycle is : ",style: TextStyle(fontSize: 30),)

                      ),
                      Align(
                          alignment: Alignment(0.0,-0.5),
                          child: Text("$bar",style: TextStyle(fontSize: 40,color: Colors.white),)

                      ),

                      Align(
                          alignment: Alignment(0.0,0.3),
                          child: Text("NOTE : "
                              "after parking the cycle lock the cycle and return the keys to security ",style: TextStyle(fontSize: 20),)

                      ),

                      Align(
                          alignment: Alignment(0.0,-0.1),
                          child: Text("TIMER : $seconds",style: TextStyle(fontSize: 40,color: Colors.white))

                      ),

                      Align(
                          alignment: Alignment(0.0,0.8),
                          child: SizedBox(
                            height: 50,
                            width: 200,

                            child:
                            TextButton(child: Text("Return Cycle",style: TextStyle(color: Colors.white,fontSize: 20)),style:TextButton.styleFrom(backgroundColor: Color(0xFF69D8D5)),

                                onPressed:() {
                              te=2;
                                  bar = "null";
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  _endQRScanPage()),

                                  );
                                  // if(vdno==h) {
                                  //   stoptimer();
                                  //   cash();
                                  //   String da=data!.displayName.toString().replaceAll(new RegExp(r'[^\w\s]+'),'');
                                  //   var cr=cred-cost;
                                  //   dbb.update({"$da/credit":cr});
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const end()),
                                  //   );
                                  // }
                                }
                            ),
                          )

                      ),

                    ],

                  ),

                ))


          ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF69D8D5),
        elevation: 30,
        title: Text("Cycway"),
      ),
    );}
}



class end extends StatefulWidget {
  const end({Key? key}) : super(key: key);

  @override
  State<end> createState() => _endState();
}

class _endState extends State<end> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF701ebd),
          elevation: 30,
          title: Text("Cycway"),
        ),
        body: Stack(
          children:[
            Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      Color(0xff69d8d5),
                      Color(0xff69d8d5),
                      Color(0xffcc5ed0),
                      Color(0xffcc5ed0),

                    ],

                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                  )
              ),),
            Align(
              alignment: Alignment(0.0,-0.7),
              child: Text("REPORT",style: TextStyle(fontSize: 40,color: Colors.white),),
            ),
            Align(
              alignment: Alignment(0.0,-0.5),
              child: Text("cycle used for :$seconds sec",style:TextStyle(fontSize: 25)),
            ),
            Align(
              alignment: Alignment(0.0,-0.3),
              child: Text("amount detected : $cost credits",style:TextStyle(fontSize: 25)),
            ),
            Align(
              alignment: Alignment(0.0,0.2),
              child: Text("Thank you !!!",style: TextStyle(fontSize: 40,color: Colors.white),),
            ),
            Align(
                alignment: Alignment(0.0,0.6),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child:
                  TextButton(child: Text("HOME",style: TextStyle(color: Colors.white,fontSize: 20)),style:TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                      onPressed:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const home()),

                        );
                        seconds=0;
                        te=1;

                      }
                  ),
                )
            )

          ],
        )
    );
  }
}

class _QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()   => QRScanPageState();
}
class QRScanPageState extends State<_QRScanPage> {
  final qrKey= GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble() async{
    super.reassemble();

    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Stack(
        alignment:Alignment.center,
        children: <Widget>[

          builtQRView(context),
          Align(alignment: Alignment(0.0,0.0), child: builtResult()),

        ],
      ),
    ),
  );
  Widget builtResult()=>Container(alignment: Alignment(0.0,0.8),
    padding:const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white24,
    ),
    child: Text(
      barcode != null ? ' got it dude ':'Scan the qr ',
      maxLines: 3,style: TextStyle(fontSize: 20),
    ),

  );

  Widget builtQRView(BuildContext context) =>QRView(
    key:qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay:QrScannerOverlayShape(
      borderColor:Color(0xFF69D8D5),
      borderRadius: 10,
      borderLength: 20,
      borderWidth: 10,
      cutOutSize: MediaQuery.of(context).size.width *0.8,
    ),
  );
  void onQRViewCreated(QRViewController controller) {
    setState(()=>this.controller = controller );


    controller.scannedDataStream
        .listen((barcode){setState(() => this.barcode=barcode

    );
    bar=barcode.code;
    cyc=bar;

    print("hooo $cyc");

    if(te==1){
      controller.stopCamera();
      HapticFeedback.vibrate();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const rent()));};
    setState(() {
      te=0;
    });});

  }
}


class _endQRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()   => endQRScanPageState();
}
class endQRScanPageState extends State<_endQRScanPage> {



  final qrKey= GlobalKey(debugLabel: 'QR');

  var dbb=db.child('users');
  var dbbb=db.child('Location');

  Barcode? barcode;
  QRViewController? controller;
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble() async{
    super.reassemble();

    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
  @override
  // final db= FirebaseDatabase.instance.reference();

  _activelisten(){
    db.child("Location/$endda/valuedQR/valueDis").onValue.listen((event) {
      final String cred1 = event.snapshot.value.toString();
      setState(() {
        vdno=cred1;
        print(vdno);
        controller!.stopCamera();


      });
    });


  }
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Stack(
        alignment:Alignment.center,
        children: <Widget>[

          builtQRView(context),
          Align(alignment: Alignment(0.0,0.0), child: builtResult()),

        ],
      ),
    ),
  );
  Widget builtResult()=>Container(alignment: Alignment(0.0,0.8),
    padding:const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white24,
    ),
    child: Text(
      barcode != null ? ' got it dude ':'Scan the qr ',
      maxLines: 3,style: TextStyle(fontSize: 20),
    ),

  );

  Widget builtQRView(BuildContext context) =>QRView(
    key:qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay:QrScannerOverlayShape(
      borderColor:Color(0xFF69D8D5),
      borderRadius: 10,
      borderLength: 20,
      borderWidth: 10,
      cutOutSize: MediaQuery.of(context).size.width *0.8,
    ),
  );
  void onQRViewCreated(QRViewController controller) {
    setState(()=>this.controller = controller );


    controller.scannedDataStream
        .listen((barcode){setState(() => this.barcode=barcode

    );
    bar=barcode.code;
    endda=bar.substring(0,bar.indexOf("-"));

    print(bar);
    print(te);
    if(te==2){
      _activelisten();

      if(vdno==bar){
        HapticFeedback.vibrate();


        stoptimer();
        cash();
        String da=data!.displayName.toString().replaceAll(new RegExp(r'[^\w\s]+'),'');
        var cr=cred-cost;
        dbbb.update({"$endda/valuedQR/name":daa});
        dbbb.update({"$endda/valuedQR/cylScn":cyc});
        dbbb.update({"$endda/valuedQR/flag":0});


        dbb.update({"$da/credit":cr});
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const end()),
        );
      setState(() {
        te=0;

      });}}});

  }
}