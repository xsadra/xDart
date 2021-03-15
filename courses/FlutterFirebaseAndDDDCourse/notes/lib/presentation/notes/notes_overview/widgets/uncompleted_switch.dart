import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/application/notes/note_watcher/note_watcher_bloc.dart';

//? Step 75: create [UncompletedSwitch] to toggle uncompleted and completed notes
//? Step 76: add [flutter_hooks] package and use [HookWidget] instead of [StateFullWidget]
class UncompletedSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkResponse(
        onTap: () {
          toggleState.value = !toggleState.value;
          context.read<NoteWatcherBloc>().add(
                toggleState.value
                    ? const NoteWatcherEvent.watchUncompletedStarted()
                    : const NoteWatcherEvent.watchAllStarted(),
              );
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: toggleState.value
              ? const Icon(Icons.check_box_outline_blank, key: Key('unchecked'))
              : const Icon(Icons.indeterminate_check_box, key: Key('checked')),
        ),
      ),
    );
  }
}
