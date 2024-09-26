import 'package:flutter/material.dart';
import 'package:quotation_app/utils/color_constants.dart';

class QuotationCard extends StatelessWidget {
  final String sNo;
  final String quotationNo;
  final String customerName;
  final String date;
  final String fromPlace;
  final String toPlace;
  final String amount;
  final String phoneNo;
  const QuotationCard({
    super.key,
    required this.sNo,
    required this.quotationNo,
    required this.customerName,
    required this.date,
    required this.fromPlace,
    required this.toPlace,
    required this.amount,
    required this.phoneNo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: ColorConstants.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sNo,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "QUOTATIONS : #$quotationNo",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.account_box, size: 20),
                Text(
                  customerName,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  "₹ $amount",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FROM",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      "TO",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fromPlace.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    const Icon(Icons.emoji_transportation),
                    const Spacer(),
                    Text(
                      toPlace.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.phone, size: 10),
                Text(
                  phoneNo,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.picture_as_pdf, size: 10),
                const Text(
                  "Share PDF",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              color: Colors.grey,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "More Options",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.more)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
