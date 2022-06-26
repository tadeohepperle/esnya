import 'package:esnya/presentation/core/core.dart';

Future<T?> showPaddedDialog<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(EsnyaSizes.base * 2),
              child: builder(context)),
        ],
      );
    },
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black54,
    useSafeArea: true,
    useRootNavigator: true,
    routeSettings: routeSettings,
  );
}

void main(List<String> args) {}
