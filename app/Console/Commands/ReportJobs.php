<?php

namespace App\Console\Commands;

use App\Models\Job;
use Illuminate\Console\Command;

class ReportJobs extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'report:jobs';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Display a list of all jobs in a readable format';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $jobs = Job::get();

        if($jobs->isEmpty()){
            $this->info('No jobs found.');
            return;
        }

        foreach ($jobs as $job) {
            $company = $job->company_name ?? 'Unknown Company';
            $title = $job->title ?? 'No Title';
            $location = $job->location ?? 'Unknown Location';
            $type = $job->job_type ?? 'Unknown Type';

            $this->line("[$company] $title — $location ($type)");
        }
    }
}
