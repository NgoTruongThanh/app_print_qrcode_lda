import 'package:app_print_qrcode_lda/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingItem extends StatelessWidget {
  final double size;

  const LoadingItem({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: size*1.5,
          width: size*1.5,
          child: SpinKitChasingDots(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(size)),
                  color: index.isEven ? ThemeConfig.primaryColor : ThemeConfig.greenColor,
                ),
              );
            },
          ),
        ));
  }
}
