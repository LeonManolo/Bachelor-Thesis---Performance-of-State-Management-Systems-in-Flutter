import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const String githubToken = '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'; // access token
const int rateLimit = 10; // Requests per minute
const String searchQuery =
    '"import \'package:flutter_bloc/flutter_bloc.dart\';" "BlocBuilder" language:Dart';
const int itemsPerPage = 100;

/// Does not help because github caps the results
Future<void> main() async {
  final uniqueUsers = <String>{};
  var currentPage = 1;
  var totalResults = 0;
  var hasPagesLeft = true;

  while (hasPagesLeft) {
    final response = await _searchGitHubCode(searchQuery, currentPage);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (currentPage == 1) {
        totalResults = jsonResponse['total_count'] as int;
      }
      for (final item in jsonResponse['items'] as List) {
        final githubUsername = item['repository']['owner']['login'] as String;
        uniqueUsers.add(githubUsername);
      }

      hasPagesLeft = currentPage * itemsPerPage < totalResults;
      currentPage++;
    } else {
      print('Request failed: ${response.statusCode}');
      break;
    }
    // Rate Limiting
    await Future<void>.delayed(const Duration(seconds: 60 ~/ rateLimit));
  }

  print('total results: $totalResults');
  print('Unique users: ${uniqueUsers.length}');
}


Future<http.Response> _searchGitHubCode(String query, int page) async {
  final headers = {
    'Authorization': 'token $githubToken',
    'Accept': 'application/vnd.github.v3+json',
  };
  final uri = Uri.parse(
    'https://api.github.com/search/code',
  ).replace(
    queryParameters: {
      'q': query,
      'page': page.toString(),
      'per_page': itemsPerPage.toString(),
    },
  );

  print(uri.toString());
  return await http.get(uri, headers: headers);
}
