import '/backend/supabase/supabase.dart';
import '/components/product/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Product component.
  late ProductModel productModel1;
  // Model for Product component.
  late ProductModel productModel2;
  // Model for Product component.
  late ProductModel productModel3;
  // Model for Product component.
  late ProductModel productModel4;
  // Model for Product component.
  late ProductModel productModel5;

  @override
  void initState(BuildContext context) {
    productModel1 = createModel(context, () => ProductModel());
    productModel2 = createModel(context, () => ProductModel());
    productModel3 = createModel(context, () => ProductModel());
    productModel4 = createModel(context, () => ProductModel());
    productModel5 = createModel(context, () => ProductModel());
  }

  @override
  void dispose() {
    productModel1.dispose();
    productModel2.dispose();
    productModel3.dispose();
    productModel4.dispose();
    productModel5.dispose();
  }
}
