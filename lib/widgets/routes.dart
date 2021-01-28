import 'package:ecommerceapp/pages/transaction_history_page.dart';
import 'package:ecommerceapp/screens/about_us_screen.dart';
import 'package:ecommerceapp/screens/follow_us_screen.dart';
import 'package:ecommerceapp/screens/main_screen.dart';
import 'package:ecommerceapp/screens/privacy_policy_screen.dart';
import 'package:ecommerceapp/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Routes {



  static List<dynamic> getUserRoutes(var context, var pageName, var mainCtx  ,name , email) {

    launchURL() async {
      const url = 'https://play.google.com/store/apps/details?id=com.techeor.apnathanda';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _showDialog() async {
      await showDialog<String>(
        context: mainCtx,
        child: new AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 300,
              child: FollowUsScreen(mainCtx)),
        ),
      );
    }


    var settingsTab = ListTile(
      title: Text("Profile"),
      leading: Icon(Icons.person),
      onTap: () {

          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen(mainCtx)),
          );
      },
    );

    var aboutUs = ListTile(
      title: Text("About Us"),
      leading: Icon(Icons.info),
      onTap: () {

        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutUsScreen(mainCtx)),
        );
      },
    );

    var historyTab = ListTile(
      title: Text("Order History"),
      leading: Icon(Icons.history),
      onTap: () {
        Navigator.pushReplacement(
          mainCtx,
          MaterialPageRoute(builder: (context) => MainScreen(name , email , "history")),
        );
      },
    );

    var feedbackTab = ListTile(
      title: Text("Feedback"),
      leading: Icon(Icons.rate_review),
      onTap: () {

        Navigator.of(context).pop();

        launchURL();

      },
    );



    var policyTab = ListTile(
      title: Text("Policy"),
      leading: Icon(Icons.policy),
      onTap: () {

        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PolicyScreen(mainCtx)),
        );
      },
    );

    var followUsTab = ListTile(
      title: Text("Follow Us"),
      leading: Icon(Icons.share),
      onTap: () {
        _showDialog();
      },
    );





    return [
      settingsTab,
      policyTab,
      historyTab,
      aboutUs,
      feedbackTab
    ];




  }





}

