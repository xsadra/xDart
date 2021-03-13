import 'package:flutter/material.dart';
import 'package:notes/domain/notes/note_failure.dart';

//? Step 72: create [CriticalFailureDisplay] to show failures
class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({
    Key key,
    @required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 156.0,
          ),
          Text(
            failure.maybeMap(
              insufficientPermission: (_) => 'Insufficient Permissions',
              orElse: () => 'Unexpected error. \nPlease contact support.',
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.red.shade500,
              wordSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
