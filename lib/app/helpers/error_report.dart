import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

Future reportError({required String className, required Object error}) async {
  final dialogService = locator<DialogService>();
  final log = getLogger(className);
  log.e(error.toString());
  await dialogService.showDialog(
    title: "Something went wrong",
    description: error.toString(),
    dialogPlatform: DialogPlatform.Custom,
  );
}
