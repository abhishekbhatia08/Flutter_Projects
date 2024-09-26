import 'package:flutter/material.dart';
import 'package:quotation_app/screens/quotation_screen.dart';
import 'package:quotation_app/utils/color_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quotation_app/utils/images_constant.dart';
import 'package:quotation_app/widgets/dashboard_options.dart';
import 'package:quotation_app/widgets/push_navigator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        leading: const Icon(
          Icons.format_list_bulleted,
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Quotation App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.manage_accounts,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            //Slider Container properties
            options: CarouselOptions(
              height: 165,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              viewportFraction: 0.85,
            ),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int realIndex) =>
                Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(ImagesConstant.carousel),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 5,
              children: <Widget>[
                DashboardOptions(
                  optionName: "Quotations",
                  image: ImagesConstant.quotation,
                  onTap: () {
                    pushNavigator(context, const QuotationScreen());
                  },
                ),
                DashboardOptions(
                  optionName: "Survey List",
                  image: ImagesConstant.quotation,
                  onTap: () {},
                ),
                DashboardOptions(
                  optionName: "Packing List",
                  image: ImagesConstant.quotation,
                  onTap: () {},
                ),
                DashboardOptions(
                  optionName: "LR-Bility",
                  image: ImagesConstant.quotation,
                  onTap: () {},
                ),
                DashboardOptions(
                  optionName: "Bill",
                  image: ImagesConstant.quotation,
                  onTap: () {},
                ),
                DashboardOptions(
                  optionName: "Car Condition",
                  image: ImagesConstant.quotation,
                  onTap: () {},
                ),
                DashboardOptions(
                  optionName: "PB Card",
                  image: ImagesConstant.quotation,
                  onTap: () {},
                ),
                DashboardOptions(
                  optionName: "Money Reciept",
                  image: ImagesConstant.quotation,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
