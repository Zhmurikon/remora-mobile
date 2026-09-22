import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for ModerationApi
void main() {
  final instance = RemoraApi().getModerationApi();

  group(ModerationApi, () {
    // Очередь жалоб
    //
    //Future<BuiltList<ReportItem>> listReportsApiV1ModerationReportsGet({ ReportStatus status, int offset, int limit }) async
    test('test listReportsApiV1ModerationReportsGet', () async {
      // TODO
    });

    // Решение по жалобе
    //
    //Future<ReportItem> resolveReportApiV1ModerationReportsReportIdResolvePost(String reportId, ReportResolution reportResolution) async
    test('test resolveReportApiV1ModerationReportsReportIdResolvePost', () async {
      // TODO
    });

  });
}
