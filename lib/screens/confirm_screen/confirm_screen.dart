 
 
import 'package:flutter/material.dart';
import 'package:smartboard/screens/home/home_screen.dart';
 

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen>
    with SingleTickerProviderStateMixin {
      
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
   bool  showpassword=true;
    bool  showconfirmpassword=true;

   
  @override
  

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
         // padding: const EdgeInsets.fromLTRB(70, 100, 70, 0),
          padding: const EdgeInsets.fromLTRB(30, 110, 30, 40),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                        Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 250,
                                child: Image.asset('assets/images/splash.jpeg'),
                              ),
                            ),
                            
                            const SizedBox(
                            height: 40,
                          ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:showpassword,
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال كلمة المرور';
                      }
                       if (value.length < 6) {
                        return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                        }
                      return null;
                    },
                            decoration:  InputDecoration(
                                //border: OutlineInputBorder(),
                                labelText: ' كلمة المرور الجديدة',
                                labelStyle: const TextStyle(
                                    fontFamily: 'Kenyan Coffee',
                                    //color: Color(0xFF508AFF),
                                     color: Color.fromARGB(255, 13, 73, 194),
                                    fontSize: 16
                                    ),
                                       //prefixIcon: Icon(
                                      ////  Icons.lock,
                                          //   ),  
                                  suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showpassword = !showpassword;
                                 
                              });
                            },
                            icon: showpassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(
                                    Icons.visibility,
                                  ),
                          ),




                                //style: TextStyle(fontFamily: 'Kenyan Coffee'),
                              ),
                    
                        
                   
                  ),

                   const SizedBox(
                          height: 18,
                        ),
                  TextFormField(
                     controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:showconfirmpassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' يرجي تاكيد كلمه المرور';
                      }
                      if (value != _passwordController.text) {
                        return ' كلمه المرور لا تتفق ';
                      }
                      return null;
                    },
                       decoration:  InputDecoration(
                                //border: OutlineInputBorder(),
                                labelText: 'تاكيد كلمة المرور الجديدة ',
                                labelStyle: const TextStyle(
                                    fontFamily: 'Kenyan Coffee',
                                    color: Color.fromARGB(255, 13, 73, 194),
                                    fontSize: 16,
                                    ),
                                    suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showconfirmpassword = !showconfirmpassword;
                              });
                              
                            },
                            icon:  showconfirmpassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(
                                    Icons.visibility,
                                  ),
                          ),
                              ), ),
                    
                 

                  const SizedBox(height: 40),
                  
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
                            if (_formKey.currentState!.validate())
                             {
                              _formKey.currentState!.save();
                              
                              // print(_passwordController.text);
                               
                                var router =  MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreens(),
                    );
                    //can back for previos page
                    Navigator.of(context).pushReplacement(router);
                            }
                            },
                            child: const Text(
                              'تغيير كلمة المرور',
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
          
            ),
          ),
        ),
      ),
    );
  }
}
