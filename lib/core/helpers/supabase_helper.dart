import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://qumvseeskvkcgwvvxzpi.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF1bXZzZWVza3ZrY2d3dnZ4enBpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxMTY3MTUsImV4cCI6MjA2NTY5MjcxNX0.pQbFlIcW9mPK7z4-I1gMDaDtijZ-01ccpM-FQAiRHdY',
    );
  }
}
