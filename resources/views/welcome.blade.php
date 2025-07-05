<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Listings</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-white">

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <h1 class="text-3xl font-bold mb-8 text-center">Job Listings</h1>

        <!-- Search and Filter -->
        <form method="GET" action="" class="mb-8 grid grid-cols-1 md:grid-cols-3 gap-4">
            <input type="text" name="search" value="<?php echo e(request()->get('search')); ?>"
                   placeholder="Search by title, company or location"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 text-gray-900 dark:text-white focus:outline-none focus:ring">

            <select name="job_type"
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 text-gray-900 dark:text-white focus:outline-none focus:ring">
                <option value="">All Types</option>
                <option value="Full-time" <?php echo e(request()->get('job_type') == 'Full-time' ? 'selected' : ''); ?>>Full-time</option>
                <option value="Part-time" <?php echo e(request()->get('job_type') == 'Part-time' ? 'selected' : ''); ?>>Part-time</option>
                <option value="Contract"  <?php echo e(request()->get('job_type') == 'Contract' ? 'selected' : ''); ?>>Contract</option>
            </select>

            <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded transition">
                Search
            </button>
        </form>

        <!-- Job Cards -->
        <?php if ($jobs->count()): ?>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <?php foreach ($jobs as $job): ?>
                    <div class="bg-white dark:bg-gray-800 shadow-md rounded-lg p-6 flex flex-col justify-between">
                        <div>
                            <div class="flex justify-between items-center mb-4">
                                <h2 class="text-lg font-semibold"><?php echo ($job->title); ?></h2>
                                <?php if ($job->logo): ?>
                                    <img src="<?php echo e(asset('storage/' . $job->logo)); ?>" alt="Logo"
                                         class="h-12 w-12 object-contain rounded">
                                <?php endif; ?>
                            </div>
                            <p class="text-sm text-gray-600 dark:text-gray-300 mb-1"><strong>Company:</strong> <?php echo e($job->company_name); ?></p>
                            <p class="text-sm text-gray-600 dark:text-gray-300 mb-1"><strong>Location:</strong> <?php echo e($job->location); ?></p>
                            <p class="text-sm text-gray-600 dark:text-gray-300 mb-4"><strong>Type:</strong> <?php echo e($job->job_type); ?></p>
                        </div>
                        <?php if ($job->apply_link): ?>
                            <a href="<?php echo e($job->apply_link); ?>" target="_blank"
                               class="mt-auto inline-block bg-blue-600 hover:bg--200 text-white text-sm font-medium py-2 px-4 rounded text-center transition">
                                Apply Now
                            </a>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            </div>

            <!-- Pagination -->
            <div class="mt-10 text-center">
                <?php echo $jobs->appends(request()->query())->links('pagination::tailwind'); ?>
            </div>
        <?php else: ?>
            <p class="text-gray-600 dark:text-gray-300 text-center mt-10">No jobs found.</p>
        <?php endif; ?>
    </div>

</body>
</html>
