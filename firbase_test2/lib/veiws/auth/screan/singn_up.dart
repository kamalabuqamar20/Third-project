import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

 /* var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var pass = TextEditingController();*/

  @override
  Widget build(BuildContext context) {
    var consumer = Consumer<AuthProvider>(
        builder: (context,provider,x) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
              right: 20,
              left: 20,
            ),
            child: Stack(
              children: [
               Form(
              key: provider.signUpKey,
                  child: Column(
                    children: [
                      const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                   /*   /*name*/ Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: double.infinity,
                        child: TextFormField(
                      //    controller: name,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                            ),
                            hintText: 'Full Name',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),*/
                      const SizedBox(height: 15),
                      /*email*/ Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: double.infinity,
                        child: TextFormField(
                            validator: provider.emailValidation,
                       controller: provider.emailController,
                       //   controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                            ),
                            hintText: 'Email Address',
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                   /*   /*phone*/ Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: double.infinity,
                        child: TextFormField(
                         // controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                            ),
                            hintText: 'Phone Number',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),*/
                      const SizedBox(height: 15),
                      /*password*/ Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: double.infinity,
                        child: TextFormField(
                           validator: provider.passwordValidation,
                      
                     controller: provider.passwordController,
                         // controller: pass,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintMaxLines: 2,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      /*sign up*/ Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 50,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                          /*  print(name.text);
                            print(email.text);
                            print(phone.text);
                            print(pass.text);*/
                            provider.singnUp();
                          },
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 240, 199, 60),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              /*  Padding(
                  padding: const EdgeInsets.only(top: 490.0),
                  child: Column(
                    children: [
                      const Text('Or create an account using social media'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            elevation: 0,
                            highlightColor: const Color.fromARGB(255, 240, 199, 60),
                            hoverColor: const Color.fromARGB(255, 240, 199, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: const Color.fromARGB(255, 240, 199, 60),
                            onPressed: () {},
                            child: const Image(
                                image: AssetImage('assets/logos/facebook.jpg'),
                                width: 30),
                          ),
                       /*   MaterialButton(
                            elevation: 0,
                            highlightColor: const Color.fromARGB(255, 240, 199, 60),
                            hoverColor: const Color.fromARGB(255, 240, 199, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: const Color.fromARGB(255, 240, 199, 60),
                            onPressed: () {},
                            child: const Image(
                                image: AssetImage('assets/Instagram.png'),
                                width: 35),
                          ),*/
                          MaterialButton(
                            elevation: 0,
                            highlightColor: const Color.fromARGB(255, 240, 199, 60),
                            hoverColor: const Color.fromARGB(255, 240, 199, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: const Color.fromARGB(255, 240, 199, 60),
                            onPressed: () {},
                            child: const Image(
                                image: AssetImage('assets/logos/google.jpg'), width: 35),
                          ),
                        ],
                      )
                    ],
                  ),
                )*/
              ],
            ),
          );
        }
      );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 199, 60),
    // backgroundColor: Colors.te,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Pr',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'e',
              style: TextStyle(
                fontSize: 50.0,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'sent',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
       // centerTitle: true,
       titleSpacing: 10,
       automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      ),
      body: ListView(
        children: [
         const SizedBox(height: 20,),
          CircleAvatar(radius: 30,backgroundColor:const Color.fromARGB(255, 25, 138, 29),child: Image.asset('assets/logos/buy.png',fit: BoxFit.cover,),),
         const SizedBox(height: 20,),
          consumer,
        ],
      ),
    );
  }
}