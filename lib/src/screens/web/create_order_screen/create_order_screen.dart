import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_brand_scanner/src/common/widgets/modals/error_modal.dart';
import 'package:nft_brand_scanner/src/screens/web/create_order_screen/cubit/create_order_cubit.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController symbolController = TextEditingController();
  TextEditingController uriController = TextEditingController();
  TextEditingController minterAddressController = TextEditingController();
  TextEditingController adminAddressController = TextEditingController();
  TextEditingController royaltyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoTextField(
            controller: nameController,
            placeholder: "Name",
          ),
          CupertinoTextField(
            controller: symbolController,
            placeholder: "Symbol",
          ),
          CupertinoTextField(
            controller: uriController,
            placeholder: "URI",
          ),
          CupertinoTextField(
            controller: minterAddressController,
            placeholder: "Minter address",
          ),
          CupertinoTextField(
            controller: adminAddressController,
            placeholder: "Admin address",
          ),
          CupertinoTextField(
            controller: royaltyController,
            placeholder: "Royalty",
          ),
          BlocConsumer<CreateOrderCubit, CreateOrderState>(
            listener: (context, state) {
              if (state is CreateOrderLoaded) {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) {
                      return CupertinoAlertDialog(
                        title: Text("Успешно"),
                        content: Text("Ваш бренд создан"),
                        actions: [
                          CupertinoButton(
                              child: Text("Ок"),
                              onPressed: () {
                                Navigator.pop(_);
                                Navigator.pop(context);
                              })
                        ],
                      );
                    });
              } else if (state is CreateOrderFailed) {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return ErrorModal(
                        onTry: () {
                          Navigator.pop(context);
                        },
                        message: state.error,
                      );
                    });
              }
            },
            builder: (context, state) {
              return CupertinoButton(
                  child: Text('Создать'),
                  onPressed: state is CreateOrderLoading
                      ? null
                      : () {
                          context.read<CreateOrderCubit>().create(
                                nameController.text.trim(),
                                symbolController.text.trim(),
                                uriController.text.trim(),
                                minterAddressController.text.trim(),
                                adminAddressController.text.trim(),
                                int.tryParse(royaltyController.text.trim()) ??
                                    0,
                              );
                        });
            },
          ),
        ],
      ),
    );
  }
}
