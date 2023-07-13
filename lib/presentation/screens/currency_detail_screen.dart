import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygon_crypto/core/app_router.dart';
import 'package:polygon_crypto/domain/cubits/crypto_cubit.dart';
import 'package:polygon_crypto/domain/models/crypto/crypto_model.dart';
import 'package:polygon_crypto/presentation/widgets/divider.dart';
import 'package:polygon_crypto/presentation/widgets/table_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrencyDetailScreen extends StatelessWidget {
  const CurrencyDetailScreen({
    super.key,
    this.tickerName,
    this.tickerPrice,
  });

  final String? tickerName;
  final double? tickerPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            AppRouter.back(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          '${tickerName}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<CryptoCubit, CryptoState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: RichText(
                    text: TextSpan(
                      text: 'ЦЕНА:  ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${tickerPrice}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DividerWidget(),

                // Container(
                //   height: 100,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount: state.currentDateFilter.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: CupertinoButton(
                //           padding: EdgeInsets.all(24),
                //           color: Colors.yellow,
                //           child: Text(
                //             state.currentDateFilter.elementAt(index).name,
                //             style: TextStyle(color: Colors.black),
                //           ),
                //           onPressed: () {
                //             context
                //                 .read<CryptoCubit>()
                //                 .getCurrencyData(tickerName ?? '', days: 0);
                //           },
                //         ),
                //       );
                //     },
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       CupertinoButton(
                //         padding: EdgeInsets.zero,
                //         color: state.isActive ? Colors.green : Colors.white,
                //         child: Text(
                //           '1Д',
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         onPressed: () {
                //           context
                //               .read<CryptoCubit>()
                //               .getCurrencyData(tickerName ?? '', days: 0);
                //         },
                //       ),
                //       CupertinoButton(
                //         padding: EdgeInsets.zero,
                //         color: state.isActive ? Colors.green : Colors.white,
                //         child: Text(
                //           '5Д',
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         onPressed: () {
                //           context
                //               .read<CryptoCubit>()
                //               .getCurrencyData(tickerName ?? '', days: 4);
                //         },
                //       ),
                //       CupertinoButton(
                //         padding: EdgeInsets.zero,
                //         color: state.isActive ? Colors.green : Colors.white,
                //         child: Text(
                //           '1Н',
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         onPressed: () {},
                //       ),
                //       CupertinoButton(
                //         child: Text(
                //           '1МЕС',
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         onPressed: () {},
                //       ),
                //       CupertinoButton(
                //         child: Text(
                //           '3МЕС',
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         onPressed: () {},
                //       ),
                //     ],
                //   ),
                // ),
                DividerWidget(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<CryptoModel?, String>(
                            dataSource: [
                              state.currency,
                            ],
                            xValueMapper: (CryptoModel? data, _) =>
                                state.days.toString(),
                            yValueMapper: (CryptoModel? data, _) => data?.close,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                DividerWidget(),
                TableWidget(
                  high: state.currency?.high,
                  low: state.currency?.low,
                  open: state.currency?.open,
                  close: state.currency?.close,
                ),
                DividerWidget(),
                SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}
