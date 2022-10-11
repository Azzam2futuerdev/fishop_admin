import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishop_admin/ui/home/cubit/home_cubit.dart';
import 'package:fishop_admin/ui/product_add/view/product_add_view.dart';
import 'package:fishop_admin/ui/product_list/view/product_list.dart';
import 'package:fishop_firebase/fishop_firebase.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/firestore.dart';

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
            backgroundColor: Colors.deepPurple[600],
            onTap: (value) => context.read<HomeCubit>().setCurrentIndex(value),
            currentIndex: state.currentIndex,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurple[600],
                  icon: const Icon(
                    Icons.healing,
                    color: Colors.white,
                  ),
                  label: 'İstekler'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurple[600],
                  icon: const Icon(
                    Icons.approval,
                    color: Colors.white,
                  ),
                  label: 'Onay Durumları'),
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
        default:
          return const Text("Wrong selection");
      }
    });
  }
}
