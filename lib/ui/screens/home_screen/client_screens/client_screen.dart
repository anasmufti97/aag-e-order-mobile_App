import 'package:aag_e_order_app/bloC/client/all_client_cubit/all_client_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/all_client_api_response.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'add_client_screen.dart';
import 'components/client_list_view_builder.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  AllClientApiResponse? clientApiResponse;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<AllClientCubit>().allClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllClientCubit, AllClientState>(
      listener: (context, state) {
        if (state is FailedToFetchData) {
          showSnackBar(context, state.message);
        }
        if (state is AllClientFetchedSuccessfully) {
          clientApiResponse = state.client;

        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.green,
              title: const Text("All Clients"),
              // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
            ),
            body: ClientViewBuilder(clientApiResponse),
          ),
        );
      },
    );
  }

  Row _buildTopAppbar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        height: 40,
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
              hintText: "Search here ?",
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        searchController.clear();
                        searchResult(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
              hintStyle: const TextStyle(fontSize: 12.0, color: AppColors.dullWhite),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              contentPadding: const EdgeInsets.all(10.0)),
          onSubmitted: (text) {
            searchResult(context);
          },
          onChanged: (value) {
            searchResult(context);
          },
        ),
      ),
      const SizedBox(
        width: 20,
      )
      // IconButton(
      //     icon: const Icon(Icons.search),
      //     onPressed: () {
      //       searchResult(context);
      //     }),
    ]);
  }

  Future<void> searchResult(BuildContext context) async {
    if (searchController.text.isEmpty) {
      context.read<AllClientCubit>().allClient();
    } else {
     // await context.read<AllClientCubit>().searchClient(name: searchController.text);
      print("called...");
    }
  }
}
