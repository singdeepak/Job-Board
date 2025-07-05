@extends('layouts.app')

@section('content')
    <div class="max-w-3xl mx-auto bg-white dark:bg-gray-800 shadow-md rounded-lg p-6 mt-8">
        <h2 class="text-2xl font-semibold text-gray-800 dark:text-white mb-6">Create New Job</h2>

        @if ($errors->any())
            <div class="mb-4 p-4 bg-red-100 text-red-700 rounded">
                <ul class="list-disc list-inside">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('job.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <!-- Title -->
            <div class="mb-4">
                <label for="title" class="block text-gray-700 dark:text-gray-200 mb-2">Job Title</label>
                <input type="text" name="title" id="title" value="{{ old('title') }}" required
                       class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            <!-- Company Name -->
            <div class="mb-4">
                <label for="company_name" class="block text-gray-700 dark:text-gray-200 mb-2">Company Name</label>
                <input type="text" name="company_name" id="company_name" value="{{ old('company_name') }}" required
                       class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            <!-- Location -->
            <div class="mb-4">
                <label for="location" class="block text-gray-700 dark:text-gray-200 mb-2">Location</label>
                <input type="text" name="location" id="location" value="{{ old('location') }}" required
                       class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            <!-- Job Type -->
            <div class="mb-4">
                <label for="job_type" class="block text-gray-700 dark:text-gray-200 mb-2">Job Type</label>
                <select name="job_type" id="job_type" required
                        class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
                    <option value="">Select Type</option>
                    <option value="Full-time" {{ old('job_type') == 'Full-time' ? 'selected' : '' }}>Full-time</option>
                    <option value="Part-time" {{ old('job_type') == 'Part-time' ? 'selected' : '' }}>Part-time</option>
                    <option value="Contract"  {{ old('job_type') == 'Contract'  ? 'selected' : '' }}>Contract</option>
                </select>
            </div>

            <!-- Description -->
            <div class="mb-4">
                <label for="description" class="block text-gray-700 dark:text-gray-200 mb-2">Job Description</label>
                <textarea name="description" id="description" rows="4" required
                          class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">{{ old('description') }}</textarea>
            </div>

            <!-- Apply Link -->
            <div class="mb-4">
                <label for="apply_link" class="block text-gray-700 dark:text-gray-200 mb-2">Apply Link (optional)</label>
                <input type="url" name="apply_link" id="apply_link" value="{{ old('apply_link') }}"
                       class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            <!-- Logo Upload -->
            <div class="mb-6">
                <label for="logo" class="block text-gray-700 dark:text-gray-200 mb-2">Company Logo (optional)</label>
                <input type="file" name="logo" id="logo" accept="image/*"
                       class="block w-full text-sm text-gray-900 dark:text-white file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100">
                <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">Minimum size: 100x100px. JPG/PNG preferred.</p>
            </div>

            <!-- Submit -->
            <div class="flex justify-end">
                <button type="submit"
                        class="px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition duration-200">
                    Create Job
                </button>
            </div>
        </form>
    </div>
@endsection
