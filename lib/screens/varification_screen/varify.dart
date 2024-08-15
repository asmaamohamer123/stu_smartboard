import 'package:flutter/material.dart';
import 'package:smartboard/screens/confirm_screen/confirm_screen.dart';
 

class MyStatefulWidget4 extends StatefulWidget {
  const MyStatefulWidget4({super.key});

  @override
  State<MyStatefulWidget4> createState() => _MyStatefulWidgetState4();
}

class _MyStatefulWidgetState4 extends State<MyStatefulWidget4> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //padding: const EdgeInsets.fromLTRB(367, 10, 70, 0),

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 105, 0, 0),
            child: Column(
              children: [
                 
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/splash.jpeg'),
                ),
          
                const SizedBox(
                  height: 40,
                ),
                  
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   //   Container(
                      //    alignment: Alignment.center,
                       //   padding: const EdgeInsets.all(10),
                       //   child: const Text(
                        //    'السبوره الالكترونيه',
                         //   style: TextStyle(
                         //       fontFamily: 'Kenyan Coffee',
                            //    color: Color(0xFF508AFF),
                            //    fontWeight: FontWeight.bold,
                            //    fontSize: 20),
                         // ),
                         // ),
                      
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'من فضلك ادخل رمز التاكيد',
                            style: TextStyle(
                                fontFamily: 'Kenyan Coffee',
                                //color: Color.fromARGB(255, 15, 74, 192),
                               // color: Colors.black,
                                //  color: Color.fromARGB(255, 129, 137, 173),
                                   color: Color(0xFF508AFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                ),
                          )),
                    ],
                  ),
                ),
                  
                const SizedBox(
                  height: 20,
                ),
                  
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              
                              decoration: const BoxDecoration(
                                color: Color(0xFFBBDEFB),
                                //border: Border.all(
                                  // &lt;--- left side
                                 // color: Color.fromARGB(255, 55, 84, 141),
                                // color: Color(0xFF508AFF),
                                //  width: 1.0,
                              //  ),
                              ),
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  //controller: this.code,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                      hintText: "*",
                                      counterText: '',
                                      hintStyle: TextStyle(
                                          color: Color(0xFF508AFF),
                                          fontSize: 50.0,
                                          ),
                                          )
                                          ,),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFBBDEFB),
                               // border: Border.all(
                                  // &lt;--- left side
                                //  color: Color(0xFF508AFF),
                                  //width: 1.0,
                               // ),
                              ),
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  //controller: this.code,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                      hintText: "*",
                                      counterText: '',
                                      hintStyle: TextStyle(
                                          color: Color(0xFF508AFF),
                                          fontSize: 50.0))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFBBDEFB),
                                //border: Border.all(
                                  // &lt;--- left side
                                //  color: Color(0xFF508AFF),
                                 // width: 1.0,
                                //),
                              ),
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  //controller: this.code,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                      hintText: "*",
                                      counterText: '',
                                      hintStyle: TextStyle(
                                          color: Color(0xFF508AFF),
                                          fontSize: 50.0))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFBBDEFB),
                               // border: Border.all(
                                  // &lt;--- left side
                                  //color: Color(0xFF508AFF),
                                 // width: 1.0,
                               // ),
                              ),
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  //controller: this.code,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                      hintText: "*",
                                      counterText: '',
                                      hintStyle: TextStyle(
                                          color: Color(0xFF508AFF),
                                          fontSize: 50.0))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFBBDEFB),
                               // border: Border.all(
                                  // &lt;--- left side
                                 // color: Color(0xFF508AFF),
                                 // width: 1.0,
                              //  ),
                              ),
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  //controller: this.code,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                      hintText: "*",
                                      counterText: '',
                                      hintStyle: TextStyle(
                                          color: Color(0xFF508AFF),
                                         // color: Colors.black,
                                          fontSize: 50.0))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                  
                const SizedBox(
                  height: 0,
                ),
                  
                SizedBox(
                  width: double.infinity,
                  // height: 50,
                  //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //color: Color(0xFF536DFE),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 10),
                    child: Material(
                      elevation: 5,
                      color: const Color(0xff2e386b),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: MaterialButton(
                        onPressed: () {

                                  setState(() {
                                   var router =  MaterialPageRoute(
                                    builder: (BuildContext context) => const ConfirmScreen(),
                                 );
                                                    //can back for previos page
                                 Navigator.of(context).push(router);
                                                  
                                 });
                            

                        },
                       // minWidth: 50,
                        //height: 50,
                        child: const Text(
                          'ارسال رمز التاكير',
                          
                          style: TextStyle(
                             // fontFamily: 'Keyan Coffee',
                              color: Colors.white,
                             // fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                  
                //signup screen
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
