import 'package:aag_e_order_app/bloC/policy_cubit/all_policy_cubit/all_policy_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/policy_balance_view.dart';

class PolicyBalanceScreen extends StatefulWidget {
  const PolicyBalanceScreen(this.customerAccount ,{Key? key}) : super(key: key);
  final String customerAccount;

  @override
  _PolicyBalanceScreenState createState() => _PolicyBalanceScreenState();
}

class _PolicyBalanceScreenState extends State<PolicyBalanceScreen> {

  AllPolicyApiResponse? allPolicyApiResponse;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllPolicyCubit()..allPolicy(customerAccount: widget.customerAccount),
      child: BlocConsumer<AllPolicyCubit, AllPolicyState>(
        listener: (context, state) {
          if (state is FailedToFetchData) {
            showSnackBar(context, state.message);
          }
          if (state is AllPolicyFetchedSuccessfully) {
            allPolicyApiResponse = state.policy;
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.green,
                  // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
                  title: const Text(
                    "Policy",
                    style: TextStyle(color: AppColors.offWhite),
                  ),
                ),
                body:(allPolicyApiResponse != null) ?PolicyBalanceView(allPolicyApiResponse!): SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}
