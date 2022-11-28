import 'package:fishop_admin/ui/home/cubit/home_cubit.dart';
import 'package:fishop_admin/ui/product_add/view/product_add_view.dart';
import 'package:fishop_admin/ui/product_list/view/product_list.dart';
import 'package:fishop_admin/ui/profile_list/view/profile_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final homeCubit = HomeCubit();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _buildBodyWidget(),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (value) => context.read<HomeCubit>().setCurrentIndex(value),
            currentIndex: state.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.healing,
                  ),
                  label: 'product list'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.approval,
                  ),
                  label: 'product add view'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.abc,
                  ),
                  label: 'profile view'),
            ],
          );
        },
      ),
    ));
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      switch (state.currentIndex) {
        case 0:
          return const ProductListView();
        case 1:
          return ProductAddView();
        case 2:
          return const ProfileListView();
        default:
          return const Text("Wrong selection");
      }
    });
  }
}
