import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techyspot/serviecs/supabase_service.dart';
import '../models/todo_model.dart';

final todoViewModelProvider = StateNotifierProvider<TodoViewModel, List<TodoModel>>(
  (ref) => TodoViewModel(ref.read(supabaseServiceProvider)),
);

class TodoViewModel extends StateNotifier<List<TodoModel>> {
  final SupabaseService supabaseService;

  TodoViewModel(this.supabaseService) : super([]);

  Future<void> loadTodos() async {
    final response = await supabaseService.client
        .from('todos')
        .select()
        .order('created_at', ascending: false);

    state = response.map((todo) => TodoModel.fromJson(todo)).toList();
  }

  Future<void> addTodo(String title) async {
    if (title.isEmpty) return;

    final todo = TodoModel(
      title: title,
      createdAt: DateTime.now(),
    );

    final response = await supabaseService.client
        .from('todos')
        .insert(todo.toJson())
        .select()
        .single();

    state = [TodoModel.fromJson(response), ...state];
  }

  Future<void> deleteTodo(int id) async {
    await supabaseService.client.from('todos').delete().eq('id', id);
    state = state.where((todo) => todo.id != id).toList();
  }
}