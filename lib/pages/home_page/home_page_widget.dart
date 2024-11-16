import '/backend/supabase/supabase.dart';
import '/components/product/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame.png',
                  width: 116.0,
                  height: 25.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: 60.0,
            elevation: 0.5,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                  child: Text(
                    'Букеты-бестселлеры',
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder<List<ProductRow>>(
                        future: ProductTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'best',
                            true,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ProductRow> productProductRowList =
                              snapshot.data!;

                          final productProductRow =
                              productProductRowList.isNotEmpty
                                  ? productProductRowList.first
                                  : null;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('ProductItem');
                            },
                            child: wrapWithModel(
                              model: _model.productModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: ProductWidget(
                                best: true,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                  itemCount: 4,
                  padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    24.0,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return [
                      () => wrapWithModel(
                            model: _model.productModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: ProductWidget(),
                          ),
                      () => wrapWithModel(
                            model: _model.productModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: ProductWidget(),
                          ),
                      () => wrapWithModel(
                            model: _model.productModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: ProductWidget(),
                          ),
                      () => wrapWithModel(
                            model: _model.productModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: ProductWidget(),
                          ),
                    ][index]();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
