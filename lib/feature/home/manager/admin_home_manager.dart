import 'package:flutter/material.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_home_product_list_body.dart';

enum AdminHomeFragments {
  addProduct,
  productList,
  profile,
}

final Map<AdminHomeFragments, Widget> selectedHomeFragMap = {
  AdminHomeFragments.addProduct: const SizedBox(),
  AdminHomeFragments.productList: const AdminHomeProductListBody(),
  AdminHomeFragments.profile: const SizedBox()
};

final selectedHomeFragments =
    ValueNotifier<AdminHomeFragments>(AdminHomeFragments.productList);
