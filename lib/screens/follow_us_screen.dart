import 'package:flutter/material.dart';

class FollowUsScreen extends StatefulWidget {

  var mainCtx;

  FollowUsScreen(this.mainCtx);

  @override
  _FollowUsScreenState createState() => _FollowUsScreenState();
}

class _FollowUsScreenState extends State<FollowUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildRow("images/insta_icon.png" , 'Instagram'),
          SizedBox(height: 10,),
          buildRow("images/fb_icon.png" , 'Facebook'),
          SizedBox(height: 10,),
          buildRow("images/twitter_icon.png" , 'Twitter'),
          SizedBox(height: 80,),
          Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('Cancel' , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.w600),)))
        ],
      ),
    );
  }


  buildRow(image , text)
  {
    return  Column(
      children: [
        Row(
          children: [
            Container(
                height: 45,
                width: 45,
                child: Image.asset(image)),
            SizedBox(width: 10,),
            Container(
                child: Text(text , style: TextStyle(fontSize: 20),))
          ],
        ),
        SizedBox(height: 10,),
        Divider(height: 2, color: Colors.grey,)
      ],
    );
  }

}
