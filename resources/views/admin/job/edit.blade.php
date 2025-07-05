@extends('layouts.app')

@section('content')
    <div class="max-w-3xl mx-auto bg-white dark:bg-gray-800 shadow-md rounded-lg p-6 mt-8">
        <h2 class="text-2xl font-semibold text-gray-800 dark:text-white mb-6">Edit Job</h2>

        {{-- Validation Errors --}}
        @if ($errors->any())
            <div class="mb-4 p-4 bg-red-100 text-red-700 rounded">
                <ul class="list-disc list-inside">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('job.update', $singleJob->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            {{-- Job Title --}}
            <div class="mb-4">
                <label for="title" class="block text-gray-700 dark:text-gray-200 mb-2">Job Title</label>
                <input type="text" id="title" name="title" value="{{ old('title', $singleJob->title) }}" required
                    class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 
                           text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            {{-- Company Name --}}
            <div class="mb-4">
                <label for="company_name" class="block text-gray-700 dark:text-gray-200 mb-2">Company Name</label>
                <input type="text" id="company_name" name="company_name" value="{{ old('company_name', $singleJob->company_name) }}" required
                    class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 
                           text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            {{-- Location --}}
            <div class="mb-4">
                <label for="location" class="block text-gray-700 dark:text-gray-200 mb-2">Location</label>
                <input type="text" id="location" name="location" value="{{ old('location', $singleJob->location) }}" required
                    class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 
                           text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            {{-- Job Type --}}
            <div class="mb-4">
                <label for="job_type" class="block text-gray-700 dark:text-gray-200 mb-2">Job Type</label>
                <select id="job_type" name="job_type" required
                    class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 
                           text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
                    <option value="">Select Type</option>
                    <option value="Full-time" {{ old('job_type', $singleJob->job_type) == 'Full-time' ? 'selected' : '' }}>Full-time</option>
                    <option value="Part-time" {{ old('job_type', $singleJob->job_type) == 'Part-time' ? 'selected' : '' }}>Part-time</option>
                    <option value="Contract"  {{ old('job_type', $singleJob->job_type) == 'Contract' ? 'selected' : '' }}>Contract</option>
                </select>
            </div>

            {{-- Description --}}
            <div class="mb-4">
                <label for="description" class="block text-gray-700 dark:text-gray-200 mb-2">Job Description</label>
                <textarea id="description" name="description" rows="4" required
                    class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 
                           text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">{{ old('description', $singleJob->description) }}</textarea>
            </div>

            {{-- Apply Link --}}
            <div class="mb-4">
                <label for="apply_link" class="block text-gray-700 dark:text-gray-200 mb-2">Apply Link (optional)</label>
                <input type="url" id="apply_link" name="apply_link" value="{{ old('apply_link', $singleJob->apply_link) }}"
                    class="w-full px-4 py-2 border dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 
                           text-gray-900 dark:text-white focus:outline-none focus:ring focus:border-blue-300">
            </div>

            {{-- Logo Upload --}}
            <div class="mb-6">
                <label for="logo" class="block text-gray-700 dark:text-gray-200 mb-2">Company Logo (optional)</label>
                <input type="file" id="logo" name="logo" accept="image/*"
                    class="block w-full text-sm text-gray-900 dark:text-white 
                           file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 
                           file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100">
                <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">Upload a new image if you want to replace the current one.</p>

                @if ($singleJob->logo)
                    <div class="mt-3">
                        <p class="text-sm text-gray-600 dark:text-gray-300 mb-1">Current Logo:</p>
                        <img src="{{ asset('storage/' . $singleJob->logo) }}" alt="Current Logo" class="h-20 rounded shadow">
                    </div>
                @endif
            </div>

            {{-- Buttons --}}
            <div class="flex justify-between">
                <a href="{{ route('job.index') }}" class="text-sm text-blue-600 hover:underline">← Back to Job List</a>
                <button type="submit"
                    class="px-6 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 transition duration-200">
                    Update Job
                </button>
            </div>
        </form>
    </div>
@endsection
