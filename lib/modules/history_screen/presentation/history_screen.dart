import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:upi_quick_qr/core/extensions/extensions.dart';
import 'package:upi_quick_qr/core/modal/qrcode.dart' as q;
import 'package:upi_quick_qr/modules/history_screen/presentation/cubit/history_screen_cubit.dart';
import 'package:upi_quick_qr/modules/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:upi_quick_qr/modules/qr_code_screen/presentation/qr_code_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryScreenCubit>(
      create: (context) => HistoryScreenCubit()..getHistory(),
      child: BlocBuilder<HistoryScreenCubit, HistoryScreenState>(
        builder: (context, state) {
          if (state.status == HistoryScreenStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == HistoryScreenStateStatus.error) {
            return Center(
              child: Text(state.errorMsg ?? "Something went wrong"),
            );
          }

          if (state.historyList.isEmpty) {
            return const Center(
              child: Text("No History Found"),
            );
          }
          return ListView.builder(
            itemCount: state.historyList.length,
            itemBuilder: (context, index) {
              q.QrCode qrCode = state.historyList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card.outlined(
                  // color: context.colorScheme.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        context.push(
                          QrCodeScreen(
                            upiId: qrCode.upiId,
                            name: qrCode.name,
                            amount: double.tryParse(qrCode.amount ?? "0") ?? 0,
                          ),
                        );
                      },
                      leading: SizedBox(
                        width: 40,
                        height: 40,
                        child: PrettyQrView.data(
                          data: qrCode.id,
                          errorCorrectLevel: QrErrorCorrectLevel.H,
                          decoration: const PrettyQrDecoration(
                            // background: Colors.white,
                            shape: PrettyQrRoundedSymbol(
                              // color: context.primary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      titleTextStyle: context.titleMedium,
                      subtitleTextStyle: context.labelSmall,
                      leadingAndTrailingTextStyle: context.titleSmall,
                      title: Text(qrCode.upiId),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (qrCode.name != null) Text(qrCode.name!),
                          if (qrCode.amount != null)
                            Text("${qrCode.amount!} ₹"),
                        ],
                      ),
                      contentPadding: EdgeInsets.zero,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: IconButton.outlined(
                              icon: const Icon(
                                Icons.edit,
                              ),
                              iconSize: 18,
                              onPressed: () {
                                context.read<HomeScreenCubit>().setData(
                                      qrCode.upiId,
                                      qrCode.name,
                                      qrCode.amount,
                                    );
                              },
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: IconButton.outlined(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<HistoryScreenCubit>()
                                    .delete(qrCode.id);
                              },
                              iconSize: 18,
                              color: context.error,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
