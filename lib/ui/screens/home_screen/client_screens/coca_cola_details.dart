import 'package:aag_e_order_app/bloC/client/client_detail_cubit/client_detail_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/client_detail_api_response.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'about_screen.dart';
import 'components/history_list_view.dart';

class CocaColaScreen extends StatefulWidget {
  const CocaColaScreen(this.id, this.name, {Key? key}) : super(key: key);

  final int id;
  final String name;

  @override
  _CocaColaScreenState createState() => _CocaColaScreenState();
}

class _CocaColaScreenState extends State<CocaColaScreen> {
  Client client = Client();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientDetailCubit()..addClient(id: widget.id.toString()),
      child: BlocConsumer<ClientDetailCubit, ClientDetailState>(
        listener: (context, state) {
          if (state is FailedToFetchData) {
            showSnackBar(context, state.message);
          }
          if (state is AddClientSuccessfully) {
            client = state.client;
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.green,
                  title: Text(widget.name),
                ),
                body: Column(
                  children: <Widget>[
                    // construct the profile details widget here

                    // the tab bar with two items
                    SizedBox(
                      height: 50,
                      child: AppBar(
                        backgroundColor: AppColors.green,
                        bottom: const TabBar(
                          unselectedLabelColor: AppColors.lightGrey,
                          labelColor: AppColors.dullWhite,
                          indicatorColor: AppColors.halfWhite,
                          tabs: [
                            Tab(
                              child: Text('About'),
                            ),
                            Tab(
                              child: Text('History'),
                            ),
                            Tab(
                              child: Text('Photos'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // create widgets for each tab bar here
                    Expanded(
                      child: TabBarView(
                        children: [
                          AboutScreen(client),
                          const HistoryListViewBuilder(),
                          Container(
                            color: Colors.white,
                            child: const Center(
                                child: Text(
                              "No Photos found",
                              style: TextStyle(color: Colors.black87),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
