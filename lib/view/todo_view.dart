import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techyspot/view/constants/colors.dart';
import '../view_models/todo_view_model.dart';

class TodoView extends ConsumerStatefulWidget {
  const TodoView({super.key});

  @override
  ConsumerState<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends ConsumerState<TodoView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(todoViewModelProvider.notifier).loadTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo App',), centerTitle: true),
      body: todos.isEmpty
          ? const Center(child: Text('No tasks yet. Add one!'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  color: AppColors.filledcolor,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: AppColors.black),
                      onPressed: () => ref
                          .read(todoViewModelProvider.notifier)
                          .deleteTodo(todo.id!),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.iconcolor,
        onPressed: () => _showAddDialog(),
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        title: Text('Add Task'),
        content: TextField(
          controller: _controller,
          autofocus: true,

          decoration: InputDecoration(
            hintText: 'Enter task title',
            filled: true,
            fillColor: AppColors.filledcolor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        // TextField(
        //   controller: _controller,
        // autofocus: true,
        // decoration: const InputDecoration(hintText: 'Enter task title'),
        // ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.iconcolor,
            ),
            onPressed: () {
              final title = _controller.text.trim();
              if (title.isNotEmpty) {
                ref.read(todoViewModelProvider.notifier).addTodo(title);
                _controller.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Add', style: TextStyle(color: AppColors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
