import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext _context;

  BuildContext get context => _context;

  setContext(BuildContext context) {
    _context = context;
  }

  final loadingSubject = BehaviorSubject.seeded(false);
  void setLoading(bool loading) {
    if (_isDisposed) return;
    loadingSubject.add(loading);
  }


  Future<T?> showDialogCustom<T>({required Widget child}) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  bool _isDisposed = false;

  bool get isLoading => loadingSubject.valueOrNull ?? false;

  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
    loadingSubject.close();
  }
}
