@extends('layouts.app')

@section('content')
<main class="flex-1 p-4 md:p-6 overflow-y-auto">
    <h1 class="text-2xl font-bold mb-6 text-gray-800 dark:text-white">📊 Admin Dashboard</h1>

    <!-- Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
        <div class="p-6 bg-white dark:bg-gray-800 rounded-xl shadow hover:shadow-md transition">
            <h2 class="text-lg font-semibold text-gray-700 dark:text-white mb-2">Total Jobs Posted</h2>
            <p class="text-3xl font-bold text-blue-600 dark:text-blue-400">{{ $totalJobs }}</p>
        </div>
        <div class="p-6 bg-white dark:bg-gray-800 rounded-xl shadow hover:shadow-md transition">
            <h2 class="text-lg font-semibold text-gray-700 dark:text-white mb-2">Active Jobs</h2>
            <p class="text-3xl font-bold text-green-600">
                {{ \App\Models\Job::where('expiration_date', '>', now())->count() }}
            </p>
        </div>
        <div class="p-6 bg-white dark:bg-gray-800 rounded-xl shadow hover:shadow-md transition">
            <h2 class="text-lg font-semibold text-gray-700 dark:text-white mb-2">Expired Jobs</h2>
            <p class="text-3xl font-bold text-red-600">
                {{ \App\Models\Job::where('expiration_date', '<', now())->count() }}
            </p>
        </div>
    </div>

    <!-- Latest Jobs Table -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <h2 class="text-xl font-bold text-gray-700 dark:text-white mb-4">🕓 Latest 5 Jobs</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead class="bg-gray-100 dark:bg-gray-700">
                    <tr>
                        <th class="px-4 py-3 text-left text-sm font-semibold">Title</th>
                        <th class="px-4 py-3 text-left text-sm font-semibold">Company</th>
                        <th class="px-4 py-3 text-left text-sm font-semibold">Expires On</th>
                        <th class="px-4 py-3 text-left text-sm font-semibold">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-600">
                    @foreach ($latestJobs as $job)
                        <tr class="{{ $job->expiration_date && $job->expiration_date < now() ? 'bg-red-50 dark:bg-red-900' : '' }}">
                            <td class="px-4 py-3">{{ $job->title }}</td>
                            <td class="px-4 py-3">{{ $job->company_name }}</td>
                            <td class="px-4 py-3">
                                {{ $job->expiration_date ? \Carbon\Carbon::parse($job->expiration_date)->format('Y-m-d') : 'N/A' }}
                            </td>
                            <td class="px-4 py-3">
                                @if ($job->expiration_date && $job->expiration_date < now())
                                    <span class="text-red-600 font-semibold">Expired</span>
                                @else
                                    <span class="text-green-600 font-semibold">Active</span>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</main>
@endsection
