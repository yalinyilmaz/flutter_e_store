import 'package:flutter/material.dart';

enum AdminHomeFragments {
  addProduct,
  productList,
  profile,
}

final Map<AdminHomeFragments, Widget> selectedHomeFragMap = {
  AdminHomeFragments.addProduct: const SizedBox(),
  AdminHomeFragments.productList: const SizedBox(),
  AdminHomeFragments.profile: const SizedBox()
};

final selectedHomeFragments = ValueNotifier<AdminHomeFragments>(AdminHomeFragments.productList);
