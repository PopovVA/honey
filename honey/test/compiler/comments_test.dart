import 'package:flutter_test/flutter_test.dart';
import 'package:honey/honey.dart';
import 'package:honey/src/consts/click_type.dart';
import 'package:honey/src/consts/param_names.dart';

import '../utils.dart';

void main() {
  group('Comments: ', () {
    test('Single line', () {
      expectEmpty(
        '# test',
      );
    });

    test('Multi line', () {
      expectEmpty(
        '/*\ntest\n*/',
      );
    });

    test('Multi line with single line', () {
      expectEmpty(
        '/*\ntest\n# test\n*/',
      );
    });

    test('Multiline comment with expression inside', () {
      expectEmpty(
        '/*\n'
        'tap "MyWidget"\n'
        '*/',
      );
    });

    test('Single line comment with expression inside', () {
      expectEmpty(
        '# tap "MyWidget"',
      );
    });

    test('Expression with comment next to it', () {
      final result = func(F.click, {
        pType: val(ClickType.single.name),
        pTarget: func(F.widgets, {
          pTarget: val('MyWidget'),
        }),
      });
      expectExpr(
        'tap "MyWidget" # test',
        result,
      );
    });
  });
}
