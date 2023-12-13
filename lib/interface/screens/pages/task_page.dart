import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/common/create_task_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/widget/task_widget.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/body.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/container.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/custom_bottom.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/manager/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_ui/models/class/task_class.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TaskElement> tasks = [];
  bool loading = true;
  TasksBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<TasksBloc>(context);
    bloc!.add(GetTasksEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc!.add(DisposeEvent());
    super.dispose();
  }

  Future goToCreate() async {
    final task = await Navigator.push(
      context,
      MaterialPageRoute(builder: CreateTaskScreen.builder),
    );

    if (task != null) {
      setState(
        () => tasks.add(task),
      );
    }
  }

  void onError() => debugPrint(AppLocalizations.current.errorLoading);

  void setElements(List<TaskElement> elementsBloc) => setState(() {
        tasks = elementsBloc;
        loading = false;
      });

  @override
  Widget build(BuildContext context) {
    return Body(
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomContainer(
                color: UTILSConstants.black,
                widget: const Row(),
              ),
              CustomButton(
                color: UTILSConstants.white,
                text: AppLocalizations.current.add,
                tap: goToCreate,
              ),
            ],
          ),
          SizedBox(
            height: getHeight(620),
            child: BlocListener<TasksBloc, TasksBlocState>(
              listener: (context, state) {
                if (state is BlocError) {
                  onError();
                } else if (state is GetTasksSuccess) {
                  setElements(state.tasks);
                }
              },
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(element: tasks[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
