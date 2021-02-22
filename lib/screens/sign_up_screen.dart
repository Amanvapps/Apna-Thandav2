import 'package:ecommerceapp/screens/login_screen.dart';
import 'package:ecommerceapp/services/auth_service.dart';
import 'package:ecommerceapp/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController , passwordController , nameController , phoneController
  , addressController , otpController;
  var otp="";

  bool isLoading = false;
  bool sendOtp=true;
  bool isOtpVerified = false;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    otpController = TextEditingController();
   // stateController = TextEditingController();
    addressController = TextEditingController();
   // pincodeController = TextEditingController();
  //  landmarkController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Image.asset("images/fruitsone.png" , scale: 4,)),
            ),
            loginLayout(),
            Center(
              child: (isLoading) ? Loader.getLoader() : Container(),
            )
          ],
        ),
      ),

    );
  }

  loginLayout()
  {
    return Container(
      margin: EdgeInsets.only(top: 230 , left: 20 , right: 20),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2.8,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blueGrey , width: 2)
                  ),
                  child: TextField(
                    controller: phoneController,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Phone",
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blueGrey , width: 2)
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Password",
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blueGrey , width: 2)
                  ),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Email",
                        border: InputBorder.none
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blueGrey , width: 2)
                  ),
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Name",
                        border: InputBorder.none
                    ),
                  ),
                ),

               SizedBox(height: 20,),
               // Container(
               //   padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
               //   alignment: Alignment.center,
               //   height: 60,
               //   decoration: BoxDecoration(
               //       borderRadius: BorderRadius.circular(7),
               //       border: Border.all(color: Colors.blueGrey , width: 2)
               //   ),
               //   child: TextField(
               //     controller: cityController,
               //     style: TextStyle(
               //       fontSize: 16.0,
               //     ),
               //     decoration: InputDecoration(
               //         contentPadding: EdgeInsets.only(left: 10),
               //         hintText: "City",
               //         border: InputBorder.none
               //     ),
               //   ),
               // ),
               // SizedBox(height: 20,),
               // Container(
               //   padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
               //   alignment: Alignment.center,
               //   height: 60,
               //   decoration: BoxDecoration(
               //       borderRadius: BorderRadius.circular(7),
               //       border: Border.all(color: Colors.blueGrey , width: 2)
               //   ),
               //   child: TextField(
               //     controller: stateController,
               //     style: TextStyle(
               //       fontSize: 16.0,
               //     ),
               //     decoration: InputDecoration(
               //         contentPadding: EdgeInsets.only(left: 10),
               //         hintText: "State",
               //         border: InputBorder.none
               //     ),
               //   ),
               // ),
               // SizedBox(height: 20,),
               Container(
                 padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
                 alignment: Alignment.center,
                 height: 60,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(7),
                     border: Border.all(color: Colors.blueGrey , width: 2)
                 ),
                 child: TextField(
                   controller: addressController,
                   style: TextStyle(
                     fontSize: 16.0,
                   ),
                   decoration: InputDecoration(
                       contentPadding: EdgeInsets.only(left: 10),
                       hintText: "Address",
                       border: InputBorder.none
                   ),
                 ),
               ),
               SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.blueGrey , width: 2)
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: otpController,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              hintText: "Verification Code",
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                       if(!isOtpVerified)
                        await sendCode();
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          child: (!isOtpVerified) ?
                          Text((!sendOtp) ? 'Resend OTP': 'Send OTP' , style: TextStyle(fontWeight: FontWeight.bold),) :
                         Icon(Icons.done , color: Colors.green,)
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                (isOtpVerified) ? Text('OTP sent to mobile' , style: TextStyle(fontSize: 15 , color: Colors.green),)
                    : Container()
              ],
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: () async {

                                      String email = emailController.text;
                                      String pass = passwordController.text;
                                      String name = nameController.text;
                                      String phone = phoneController.text;
//                                      String city = cityController.text;
//                                      String state = stateController.text;
                                      String address = addressController.text;
//                                      String pincode = pincodeController.text;
//                                      String landmark = landmarkController.text;


                                      if(isOtpVerified){
                                        if(pass!="" && name!="" && phone!="" && address!="" && otpController.text!="") {


                                          if(otp == otpController.text){

                                            isLoading = true;
                                            setState(() {

                                            });

                                            var res =  await AuthService.register(
                                                email,
                                                name,
                                                phone,
                                                pass,
                                                address);

                                            if(res!=null)
                                            {
                                              Fluttertoast.showToast(msg: "Successfully signed up !" , textColor: Colors.white , backgroundColor: Colors.black);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => LoginScreen()),
                                              );
                                            }


                                            isLoading = false;
                                            setState(() {

                                            });
                                          }
                                          else{
                                            Fluttertoast.showToast(msg: 'OTP not verified!' , textColor: Colors.white , backgroundColor: Colors.black);
                                          }

                                        }
                                        else
                                        {
                                          Fluttertoast.showToast(msg: 'Empty Fields!' , textColor: Colors.white , backgroundColor: Colors.black);
                                        }
                                      }
                                      else
                                      {
                                        Fluttertoast.showToast(msg: 'Please verify mobile number!' , textColor: Colors.white , backgroundColor: Colors.black);
                                      }

            },
            child: Container(
              alignment: Alignment.center,
              child: Text('Sign up' , style: TextStyle(color: Colors.white , fontSize: 20),),
              margin: EdgeInsets.only(left: 10 , right: 10),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color.fromRGBO(7, 116, 78 ,  1)
              ),
            ),
          ),
          SizedBox(height:15,),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?   ', style: TextStyle(fontSize: 17 , color: Colors.black),),
                GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Sign in' , style: TextStyle(color: Colors.blue, fontSize: 17)))
              ],
            ),
          ),
        ],
      ),
    );
  }

  sendCode() async{


      if(phoneController.text!=""){
        var response = await AuthService.requestOtp(phoneController.text);
        if(response!=null){
          otp = response.toString();
          isOtpVerified = true;
        }
        setState(() {
          sendOtp = false;
        });
      }
      else{
        Fluttertoast.showToast(msg: "Please enter phone number!");
      }



  }

}
