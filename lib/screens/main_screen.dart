import 'package:ecommerceapp/pages/cart_page.dart';
import 'package:ecommerceapp/pages/category_page.dart';
import 'package:ecommerceapp/pages/search_page.dart';
import 'package:ecommerceapp/pages/transaction_history_page.dart';
import 'package:ecommerceapp/pages/wishlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainScreen extends StatefulWidget {

  var username , email , type;

  MainScreen(this.username , this.email , this.type);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  CategoryPage categoryPage;
  WishlistPage wishlistPage;
  TransactionHistoryPage transactionHistoryPage;
  CartPage cartPage;
  SearchPage searchPage;

  int currentTabIndex = 0;
  List<Widget> pages;
  Widget currentPage;

  DateTime currentBackPressTime;

  @override
  void initState() => {
    (() async {
      categoryPage = CategoryPage(context , widget.username , widget.email);
      wishlistPage = WishlistPage(context , widget.username , widget.email);
      searchPage = SearchPage(context , widget.username , widget.email);
      transactionHistoryPage = TransactionHistoryPage(context , widget.username , widget.email);
      cartPage = CartPage(context , widget.username , widget.email , DateTime.now());


      pages = [categoryPage , wishlistPage , searchPage , cartPage  , transactionHistoryPage];
      if(widget.type == "history"){
        currentPage = transactionHistoryPage;
        currentTabIndex = 4;
      }
      else if(widget.type == "cart"){
        currentPage = cartPage;
        currentTabIndex = 3;
      }
      else
      currentPage = categoryPage;

    })()

  };


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index)
        {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        selectedItemColor: Color.fromRGBO(210, 15, 9, 1),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Orders',
          ),
        ],
      ),
      body: WillPopScope(child: currentPage, onWillPop: onWillPop),

    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 6)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit the app");
      return Future.value(false);
    }
    return Future.value(true);
  }

}
