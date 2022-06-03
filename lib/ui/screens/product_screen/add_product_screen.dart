import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var descriptionController = TextEditingController();
  var quantityController = TextEditingController();
  var itemsController = TextEditingController();
  var salesTaxController = TextEditingController();
  var batchNumberController = TextEditingController();
  var netAmountController = TextEditingController();
  var productNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
          title: const Text(
            "Add Product",
            style: TextStyle(color: AppColors.offWhite),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Nav.push(context,const AddClientScreen());
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: productNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: 'Product Name',
                      labelStyle: TextStyle(fontSize: 16),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '*',
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(fontSize: 16),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '*',
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(fontSize: 16),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '*',
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: itemsController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: 'Items',
                      labelStyle: TextStyle(fontSize: 16),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '*',
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Quantity', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: salesTaxController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Sales tax', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: batchNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Batch no', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: netAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Net Amount', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
