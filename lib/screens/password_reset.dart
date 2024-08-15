import 'package:flutter/material.dart';
import 'package:smartboard/screens/confirm_screen/confirm_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartboard/screens/home/home_screen.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {

GlobalKey<FormState> formkey = GlobalKey();
final TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

late String email;
late String password;
 final _auth = FirebaseAuth.instance;
//////////////////////
void _resetPassword() async {
  final email = emailController.text.trim();
  if (email.isEmpty) {
    // Show an error message if the email is empty
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text( 'يرجى إدخال البريد الإلكتروني')),);
    return; }                
  try 
  {  
    await _auth.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('  تم ارسال الميل ')),
    ); 
  } catch (e) {
   FirebaseAuth.instance.setLanguageCode('ar');
    String errorMessage;
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'يرجي كتابه البريد الالكتروني بشكل صحيح';
          break;
        case 'user-not-found':
          errorMessage = ' لا يوجد مستخدم لهذا البريد الالكتروني';
          break;
        default:
          errorMessage =  ' !!ttt حدث خطأ. حاول مرة اخرى ';
          break;
      }   // switch
    } //if
    else {
      errorMessage = ' !! حدث خطأ. حاول مرة اخرى ';
    }  //else
    print('Error Message: $errorMessage');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );  
  } ////catch
}   // fun

// ////////////////////////////////


  @override
  Widget build(BuildContext context) {
     return Directionality(
     textDirection: TextDirection.rtl,
        child:  Scaffold(
          backgroundColor: Colors.white,
    //  appBar: AppBar(
      //  backgroundColor: Color.fromARGB(255, 83, 109, 131),
     // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Center( 
          child: Form(
            key: formkey,
            child: ListView(
              children:[
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  //Text(
                   // 'تسجيل الدخول',
                    //style: TextStyle(
                      //fontSize: 30.0,
                     // fontWeight: FontWeight.bold,
                   // ),
                 // ),
                 Center(
                        child:
                       SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.asset('assets/images/splash.jpeg'),
                      ),
                      ),
            
            
                  const SizedBox(
                    height: 10.0,
                  ),
             
                    Column(
                      children: [
                        
            
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      // print(value);
                    },
                    onChanged: (String value) {
                      // print(value);
                      
                    },
                    //validator: (value) {
                      ////////////////////erroe
                    //  if (value!.isEmpty) {
                      //  return 'يجب كتابه عنوان البريد الالكترونى';
                     // }
            
                   // },
                   // validator: _validateEmail ,
                  
                    decoration: const InputDecoration(
                      labelText: 'عنوان البريد الالكترونى',
                      prefixIcon: Icon(
                        Icons.email,
                       // color:  Color.fromARGB(255, 13, 73, 194),
                       color:  Color.fromARGB(255, 88, 91, 99),
                      ),
                      border: 
                      //OutlineInputBorder(),
                       OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                    ),
                      
                  ),
                   const SizedBox(
                    height: 30.0,
                  ),
                     Center(
                    child: Container(
                      width: double.infinity,
                       //  width: 55 ,
                      // height: 43,
                       decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff2e386b),
                          // color:  Color.fromARGB(255, 52, 107, 109),
                          

                          ),
                     // color: Color.fromARGB(255, 83, 109, 131),
                      child: MaterialButton(
                        onPressed: () {
                        //  try {
                          //   if (formkey.currentState!.validate())
                             //  {
                               //   formkey.currentState!.save();
                                  _resetPassword();

                                  
                      
                       //var router =  MaterialPageRoute(
                     // builder: (BuildContext context) => HomeScreens(),
                   // );
                    //can back for previos page
                    //  Navigator.of(context).pushReplacement(router);
                      //  }
                        //  }
                          //catch (e) {
                            //print(e);
                        //  }//
                       },
                        child: const Text(
                          '   تم ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                           ),
                        ),
                      ),
                    ),
                  ),
                     ],
                    ),
                   
                ],
              ),
              ],
            ),

          ),
        ),
      ),
    ),
    );
  }
}