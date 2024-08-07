// import 'package:final_year_prpject/Pages/signup_screen.dart';
// import 'package:final_year_prpject/Provider/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   late AnimationController _animationController;
//   late Animation<double> _opacityAnimation;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds:3000));
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0.0, 0.5),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//         parent: _animationController, curve: Curves.easeInOut));
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, designSize: const Size(390, 844));
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(
//                     "assets/images/bg kaaliye app.png",
//                   ),
//                   fit: BoxFit.cover),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 AnimatedOpacity(
//                   duration: const Duration(milliseconds: 500),
//                   opacity: 1.0,
//                   child: Image.asset(
//                     "assets/images/kbooklogo1.png",
//                     height: 239.h,
//                     width: 239.w,
//                   ),
//                 ),
//                 Container(
//                   height: 430.h,
//                   width: 390.w,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: AnimatedBuilder(
//                     animation: _animationController,
//                     builder: (BuildContext context, Widget? child) {
//                       return Transform.translate(
//                         offset: _slideAnimation.value,
//                         child: Opacity(
//                           opacity: _opacityAnimation.value,
//                           child: SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 10.h),
//                                 ShaderMask(
//                                   shaderCallback: (Rect bounds) {
//                                     return const LinearGradient(
//                                       colors: [
//                                         Color(0xffF7614B),
//                                         Color(0xffF79448)
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                     ).createShader(bounds);
//                                   },
//                                   child: Text(
//                                     "Welcome Back!",
//                                     style: TextStyle(
//                                       fontSize: 20.58.sp,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 20.w, right: 20.w, top: 20.h),
//                                   child: Form(
//                                     autovalidateMode:
//                                         AutovalidateMode.onUserInteraction,
//                                     key: _formKey,
//                                     child: Column(
//                                       children: <Widget>[
//                                         TextFormField(
//                                           controller: emailController,
//                                           decoration: InputDecoration(
//                                             hintText: 'Email',
//                                             filled: true,
//                                             fillColor: Colors.grey[200],
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                           ),
//                                           validator: (value) {
//                                             if (value == null ||
//                                                 value.isEmpty) {
//                                               return 'Please enter your email';
//                                             }
//                                             if (!value.contains('@')) {
//                                               return 'Please enter a valid email';
//                                             }
//                                             return null;
//                                           },
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         TextFormField(
//                                           controller: passwordController,
//                                           decoration: InputDecoration(
//                                             hintText: 'Password',
//                                             filled: true,
//                                             fillColor: Colors.grey[200],
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                           ),
//                                           obscureText: true,
//                                           validator: (value) {
//                                             if (value == null ||
//                                                 value.isEmpty) {
//                                               return 'Enter password';
//                                             }
//                                             if (value.length < 8) {
//                                               return 'Password should be 8 digit';
//                                             }
//                                             return null;
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15.h,
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Provider.of<AuthProvider>(context,
//                                             listen: false)
//                                         .signIn(
//                                             emailController.text,
//                                             passwordController.text,
//                                             context);
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //       builder: (context) => Home()));

//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                       padding: EdgeInsets.zero,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20))),
//                                   child: Ink(
//                                     decoration: BoxDecoration(
//                                         gradient: const LinearGradient(
//                                             colors: [
//                                               Color(0xffF7614B),
//                                               Color(0xffF79448)
//                                             ]),
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     child: Container(
//                                       width: 347.88.w,
//                                       height: 54.h,
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         'Sign in',
//                                         style: TextStyle(
//                                             fontSize: 15.58.sp,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Do not have an account?",
//                                       style: TextStyle(
//                                           fontSize: 14.sp,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 20),
//                                       child: TextButton(
//                                         onPressed: () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       const SignUp()));
//                                         },
//                                         child: Text(
//                                           'Sign up',
//                                           style: TextStyle(
//                                               color: Colors.orange,
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w400),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:final_year_prpject/Pages/ForgotPasswordPage.dart';
import 'package:final_year_prpject/Pages/signup_screen.dart';
import 'package:final_year_prpject/Provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds:3000));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bg kaaliye app.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: 1.0,
                  child: Image.asset(
                    "assets/images/kbooklogo1.png",
                    height: 239.h,
                    width: 239.w,
                  ),
                ),
                Container(
                  height: 430.h,
                  width: 390.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: _slideAnimation.value,
                        child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 10.h),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      colors: [
                                        Color(0xffF7614B),
                                        Color(0xffF79448)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text(
                                    "Welcome Back!",
                                    style: TextStyle(
                                      fontSize: 20.58.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 20.h),
                                  child: Form(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            hintText: 'Email',
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your email';
                                            }
                                            if (!value.contains('@')) {
                                              return 'Please enter a valid email';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        TextFormField(
                                          controller: passwordController,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          obscureText: true,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter password';
                                            }
                                            if (value.length < 8) {
                                              return 'Password should be 8 digit';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPasswordPage())); // Navigate to forgot password page
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .signIn(
                                            emailController.text,
                                            passwordController.text,
                                            context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xffF7614B),
                                              Color(0xffF79448)
                                            ]),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      width: 347.88.w,
                                      height: 54.h,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 15.58.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Do not have an account?",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUp()));
                                        },
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
