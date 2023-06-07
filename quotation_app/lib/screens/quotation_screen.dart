import 'package:flutter/material.dart';
import 'package:quotation_app/utils/color_constants.dart';
import 'package:quotation_app/widgets/quotation_card.dart';

class QuotationScreen extends StatelessWidget {
  const QuotationScreen({super.key});

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
          "Quotations",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TOTAL QUOTATIONS :",
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              Text(
                "107",
                style: TextStyle(
                    color: ColorConstants.primaryColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.83,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const QuotationCard(
                  sNo: "1",
                  quotationNo: "123456",
                  customerName: "Rajiv Kumar",
                  date: "24-12-2022",
                  fromPlace: "delhi",
                  toPlace: "mumbai",
                  amount: "1025",
                  phoneNo: "9876543210",
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
