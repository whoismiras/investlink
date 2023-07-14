import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          '$tickerName',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 36,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CryptoCubit>().getCurrencyData(tickerName!);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '$tickerPrice',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const DividerWidget(),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.currentDateFilter.length,
                      itemBuilder: (context, index) {
                        final filter = state.currentDateFilter[index];
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            color: filter == state.selectedFilter
                                ? Colors.green
                                : Colors.grey.withOpacity(0.1),
                            child: Text(
                              state.currentDateFilter.elementAt(index).name,
                              style: const TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              context.read<CryptoCubit>().getCurrencyData(
                                    tickerName ?? '',
                                    days: filter,
                                  );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const DividerWidget(),
                  if ((state.currency == null) || (state.isLoading == true))
                    Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  if (state.currency != null)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SfCartesianChart(
                          primaryXAxis: DateTimeAxis(),
                          series: <ChartSeries>[
                            LineSeries<List<CryptoModel>?, DateTime>(
                              color: Colors.red,
                              width: 50,
                              isVisible: true,
                              dataSource: [
                                state.currency,
                              ],
                              xValueMapper: (List<CryptoModel>? data, _) =>
                                  DateTime.now().subtract(
                                Duration(days: state.days!),
                              ),
                              yValueMapper: (List<CryptoModel>? data, _) =>
                                  state.currency?.elementAt(_).close,
                            ),
                          ],
                        ),
                      ),
                    ),
                  const DividerWidget(),
                  if ((state.currency?.last.high == null) ||
                      (state.isLoading == true))
                    Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  if (state.currency?.last.high != null)
                    TableWidget(
                      high: state.currency?.last.high,
                      low: state.currency?.last.low,
                      open: state.currency?.last.open,
                      close: state.currency?.last.close,
                    ),
                  const DividerWidget(),
                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
