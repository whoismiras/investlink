import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:polygon_crypto/core/app_router.dart';
import 'package:polygon_crypto/domain/cubits/crypto_cubit.dart';
import 'package:polygon_crypto/presentation/widgets/currency_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Криптовалюта',
                    style: TextStyle(fontSize: 36),
                  ),
                  CupertinoButton(
                    child: const Icon(
                      Icons.search,
                      size: 36,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    context.read<CryptoCubit>().sortByName();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.draw,
                        color: Colors.grey,
                      ),
                      Text(
                        'Тикер/Название',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.read<CryptoCubit>().sortByPrice();
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Цена',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.swap_vert,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    CupertinoButton(
                      padding: EdgeInsets.all(8),
                      onPressed: () {
                        context.read<CryptoCubit>().sortByChange();
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Изм.%/\$',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.swap_vert,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            BlocBuilder<CryptoCubit, CryptoState>(
              builder: (context, state) {
                if (state.isLoading == true) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height.toDouble() / 4,
                    ),
                    child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  );
                }
                return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(12),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.cryptoCurrencies.length,
                    separatorBuilder: (_, sep) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return CurrencyWidget(
                        ticker: state.cryptoCurrencies.elementAt(index),
                        onPressed: () {
                          context.read<CryptoCubit>().getCurrencyData(
                              state.cryptoCurrencies.elementAt(index).name ??
                                  '');
                          AppRouter.toCurrencyDetail(
                              state.cryptoCurrencies.elementAt(index).name,
                              state.cryptoCurrencies.elementAt(index).price,
                              context);
                        },
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
