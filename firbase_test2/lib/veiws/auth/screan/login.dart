// import 'package:firbase_test2/veiws/auth/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// import '../../../constance/constance.dart';


// // import '../constance/constance.dart';


// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _rememberMe = false;

//  /* Widget _buildEmailTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//          //   validator:Provider.emailValidation,
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Email',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }*/

//   Widget _buildPasswordTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Password',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextField(
//             obscureText: true,
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Password',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildForgotPasswordBtn() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: FlatButton(
//         onPressed: () => print('Forgot Password Button Pressed'),
//         padding: EdgeInsets.only(right: 0.0),
//         child: Text(
//           'Forgot Password?',
//           style: kLabelStyle,
//         ),
//       ),
//     );
//   }

//   Widget _buildRememberMeCheckbox() {
//     return Container(
//       height: 20.0,
//       child: Row(
//         children: <Widget>[
//           Theme(
//             data: ThemeData(unselectedWidgetColor: Colors.white),
//             child: Checkbox(
//               value: _rememberMe,
//               checkColor: Colors.green,
//               activeColor: Colors.white,
//               onChanged: (value) {
//                 setState(() {
//                   _rememberMe = value!;
//                 });
//               },
//             ),
//           ),
//           Text(
//             'Remember me',
//             style: kLabelStyle,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoginBtn() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed: () => print('Login Button Pressed'),
//         padding: EdgeInsets.all(15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         color: Colors.white,
//         child: Text(
//           'LOGIN',
//           style: TextStyle(
//             color: Color(0xFF527DAA),
//             letterSpacing: 1.5,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'OpenSans',
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSignInWithText() {
//     return Column(
//       children: <Widget>[
//         Text(
//           '- OR -',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         SizedBox(height: 20.0),
//         Text(
//           'Sign in with',
//           style: kLabelStyle,
//         ),
//       ],
//     );
//   }

//   Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//     return GestureDetector(
//       onTap: onTap(),
//       child: Container(
//         height: 60.0,
//         width: 60.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: Offset(0, 2),
//               blurRadius: 6.0,
//             ),
//           ],
//           image: DecorationImage(
//             image: logo,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialBtnRow() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 30.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           _buildSocialBtn(
//             () => print('Login with Facebook'),
//             AssetImage(
//               'assets/logos/facebook.jpg',
//             ),
//           ),
//           _buildSocialBtn(
//             () => print('Login with Google'),
//             AssetImage(
//               'assets/logos/google.jpg',
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSignupBtn() {
//     return GestureDetector(
//       onTap: () => print('Sign Up Button Pressed'),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: 'Don\'t have an Account? ',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             TextSpan(
//               text: 'Sign Up',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<AuthProvider>(
//         builder: (context,provider,x) {
//           return AnnotatedRegion<SystemUiOverlayStyle>(
//             value: SystemUiOverlayStyle.light,
//             child: GestureDetector(
//               onTap: () => FocusScope.of(context).unfocus(),
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     height: double.infinity,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Color(0xFF73AEF5),
//                           Color(0xFF61A4F1),
//                           Color(0xFF478DE0),
//                           Color(0xFF398AE5),
//                         ],
//                         stops: [0.1, 0.4, 0.7, 0.9],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: double.infinity,
//                     child: SingleChildScrollView(
//                       physics: AlwaysScrollableScrollPhysics(),
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 40.0,
//                         vertical: 120.0,
//                       ),
//                       /////////////////////////////////////////////////////////
//                       /////////////////////////////////////////////////
//                       ///////////////////////////////////////////////////
//                       child: Form(
//                         key: provider.loginKey,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               'Sign In',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'OpenSans',
//                                 fontSize: 30.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 30.0),
//                            // _buildEmailTF(),
//                            /////////////////////////////////
//                             Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: kLabelStyle,
//         ),
//       const  SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//            validator:Provider.emailValidation,
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Email',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     ),
//                            /////////////////////////////
//                             SizedBox(
//                               height: 30.0,
//                             ),
//                             _buildPasswordTF(),
//                             _buildForgotPasswordBtn(),
//                             _buildRememberMeCheckbox(),
//                             _buildLoginBtn(),
//                             _buildSignInWithText(),
//                             _buildSocialBtnRow(),
//                             _buildSignupBtn(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         }
//       ),
//     );
//   }
// }


///import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/categories_screan.dart';
import 'singn_up.dart';

class MyStatefulWidget extends StatefulWidget {
 // const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
         backgroundColor: const Color.fromARGB(255, 240, 199, 60),
       // backgroundColor: Colors.teal[300],
        //appBar: AppBar(),
         appBar: AppBar(
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
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      ),
        body:Consumer<AuthProvider>(
          builder: (context,provider,x) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: provider.loginKey,
                child: ListView(
                  children:[ //<Widget>
                  /*  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                       // alignment: Alignment.center,
                       // padding: const EdgeInsets.all(10),
                        child:  Image.asset('assets/logos/shoping1.jpg',width: 100,height: 100,)/* Text(
                          'TutorialKart',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )*/),*/
                       const SizedBox(height: 20,),
                         CircleAvatar(radius: 30,backgroundColor:const Color.fromARGB(255, 25, 138, 29),child: Image.asset('assets/logos/buy.png',fit: BoxFit.cover,),),
                      const  SizedBox(height: 20,),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                         //   color: Colors.teal[300],
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        
                        validator: provider.emailValidation,
                         controller: provider.emailController,
                        decoration: const InputDecoration(
                           enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.black),
                              ),
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        validator: provider.passwordValidation,
                        obscureText: true,
                       controller: provider.passwordController,
                        decoration: const InputDecoration(
                           enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.black),
                              ),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     //forgot password screen
                    //   },
                    //   child: const Text('Forgot Password',),
                    // ),
                    SizedBox(height: 20,),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                           style:ElevatedButton.styleFrom(primary: Colors.black),
                          child:const  Text('Login',style: TextStyle( color:  Color.fromARGB(255, 240, 199, 60),fontSize: 20,fontWeight: FontWeight.bold),),
                          onPressed: () {
                         provider.singnIn() ; 
                            //////////////////
                            
                        //    print(nameController.text);
                         //   print(passwordController.text);
                          },
                        )
                    ),
                    ///////////////////////////////////
                    SizedBox(height: 10,),
    
                    //////////////////////////////////////////////////////
                   /*  Container(
                        height: 50,
                       // color: Colors.green,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style:ElevatedButton.styleFrom(primary: Colors.black),
                          child:const  Text('Register a new user',style: TextStyle( color:Color.fromARGB(255, 240, 199, 60),fontSize: 20,fontWeight: FontWeight.bold)),
                          onPressed: () {
                           // provider.singnUp();
                           AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen()) ;
                        //    print(nameController.text);
                         //   print(passwordController.text);
                          },
                        )
                    ),*/
                    /////////////////////////////////////////////////
                     Row(
                      children: [//<Widget>
                       const  Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Register a new user',
                            style: TextStyle(fontSize: 13,color: Colors.black),
                          ),
                          onPressed: () {
                          //   AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen()) ;
                          AppRouter.NavigateToWidget(SignUpScreen());
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(height: 20,),
                     TextButton(
                      onPressed: () {
                        //forgot password screen
                        provider.forgetPassword();
                      },
                      child: const Text('Forgot Password',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    //////////////////////////////////////////
                  
                  ],
                ),
              ));
          }
        )),
    );
  }
}