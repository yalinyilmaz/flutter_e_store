import 'package:flutter/material.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_category_list_body.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_home_add_product_body.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_home_product_list_body.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_home_profile_body.dart';

enum AdminHomeFragments {
  categories,
  addProduct,
  productList,
  profile,
}

final Map<AdminHomeFragments, Widget> selectedHomeFragMap = {
  AdminHomeFragments.addProduct: const AddProductBody(),
  AdminHomeFragments.productList: const AdminHomeProductListBody(),
  AdminHomeFragments.profile: const AdminHomeProfileBody(),
  AdminHomeFragments.categories: const AdminHomeCategoryListBody(),
};

final selectedHomeFragments =
    ValueNotifier<AdminHomeFragments>(AdminHomeFragments.productList);
