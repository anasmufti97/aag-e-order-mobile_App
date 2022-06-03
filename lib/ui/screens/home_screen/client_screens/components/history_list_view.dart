import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryListViewBuilder extends StatefulWidget {
  const HistoryListViewBuilder({Key? key}) : super(key: key);

  @override
  _HistoryListViewBuilderState createState() => _HistoryListViewBuilderState();
}

class _HistoryListViewBuilderState extends State<HistoryListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: ListView.separated(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SvgPicture.asset(
              "assets/icons/document.svg",
              color: AppColors.green,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Order',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                Text(
                  '07-12-2021',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('172.86'),
                Text('1 min ago'),
              ],
            ),
            onTap: () {
              // Nav.push(context,const CocaColaScreen());
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
