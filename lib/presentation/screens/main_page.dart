import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygon_crypto/domain/cubits/crypto_cubit.dart';
import 'package:polygon_crypto/presentation/widgets/currency_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

@override
void initState() {
  CryptoCubit().getCryptoData();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
              Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  const SizedBox(width: 20),
                  Row(
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
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          // BlocBuilder<CryptoCubit, CryptoState>(
          //   bloc: context.read<CryptoCubit>(),
          //   builder: (context, state) {
          //     return ListView.separated(
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.all(12),
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemCount: 1,
          //         separatorBuilder: (_, sep) => const SizedBox(height: 12),
          //         itemBuilder: (context, index) {
          //           return CurrencyWidget(
          //             ticker: state.data!,
          //           );
          //         });
          //   },
          // ),
        ],
      ),
    );
  }
}
