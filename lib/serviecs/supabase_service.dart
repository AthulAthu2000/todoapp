import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  late final SupabaseClient supabase;

  Future<void> init() async {
    await Supabase.initialize(
      url: 'https://uiyvckqbdowsfyblnwoh.supabase.co',
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVpeXZja3FiZG93c2Z5Ymxud29oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ5NDA0OTAsImV4cCI6MjA5MDUxNjQ5MH0.obSoJ0-QuPuzle1SsXQCY9BkoB8R8pvLfkB77ZIX4Pk",
    );
    supabase = Supabase.instance.client;
  }

  SupabaseClient get client => supabase;
}

final supabaseServiceProvider = Provider((ref) => SupabaseService());
