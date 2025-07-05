@extends('layouts.app')

@section('content')
    <div class="max-w-4xl mx-auto bg-white dark:bg-gray-800 shadow-md rounded-lg p-6 mt-8">
        <h2 class="text-2xl font-semibold text-gray-800 dark:text-white mb-6">Job Details</h2>

        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-600">
                <tbody class="divide-y divide-gray-100 dark:divide-gray-700">
                    <tr>
                        <th class="text-left px-4 py-3 text-gray-600 dark:text-gray-300">Title</th>
                        <td class="px-4 py-3 text-gray-900 dark:text-white">{{ $singleJob->title }}</td>
                    </tr>
                    <tr>
                        <th class="text-left px-4 py-3 text-gray-600 dark:text-gray-300">Company</th>
                        <td class="px-4 py-3 text-gray-900 dark:text-white">{{ $singleJob->company_name }}</td>
                    </tr>
                    <tr>
                        <th class="text-left px-4 py-3 text-gray-600 dark:text-gray-300">Location</th>
                        <td class="px-4 py-3 text-gray-900 dark:text-white">{{ $singleJob->location }}</td>
                    </tr>
                    <tr>
                        <th class="text-left px-4 py-3 text-gray-600 dark:text-gray-300">Job Type</th>
                        <td class="px-4 py-3 text-gray-900 dark:text-white">{{ $singleJob->job_type }}</td>
                    </tr>
                    <tr>
                        <th class="text-left px-4 py-3 text-gray-600 dark:text-gray-300">Description</th>
                        <td class="px-4 py-3 text-gray-900 dark:text-white">{{ $singleJob->description }}</td>
                    </tr>
                    <tr>
                        <th class="text-left px-4 py-3 text-gray-600 dark:text-gray-300">Apply Link</th>
                        <td class="px-4 py-3 text-blue-600 dark:text-blue-400">
                            @if ($singleJob->apply_link)
                                <a href="{{ $singleJob->apply_link }}" target="_blank" class="hover:underline">
                                    {{ $singleJob->apply_link }}
                                </a>
                            @else
                                <span class="text-gray-500">N/A</span>
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <th class="text-left px-4 py-3 text-gray-600 dark:text-gray-300">Company Logo</th>
                        <td class="px-4 py-3">
                            @if ($singleJob->logo)
                                <img src="{{ asset('storage/' . $singleJob->logo) }}" alt="Company Logo" class="h-20 rounded shadow">
                            @else
                                <span class="text-gray-500 dark:text-gray-400">No logo uploaded</span>
                            @endif
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="mt-6 flex justify-between">
            <a href="{{ route('job.index') }}" class="text-sm text-blue-600 hover:underline">← Back to Job List</a>
            <a href="{{ route('job.edit', $singleJob->id) }}"
               class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600 text-sm">
                Edit Job
            </a>
        </div>
    </div>
@endsection
