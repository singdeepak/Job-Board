<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class JobValidationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title'        => 'required|string|max:255',
            'company_name' => 'required|string|max:255',
            'location'     => 'required|string|max:255',
            'job_type'     => 'required|in:Full-time,Part-time,Contract',
            'description'  => 'required|string',
            'apply_link'   => 'nullable|url',
            'logo'         => 'nullable|image|dimensions:min_width=100,min_height=100',
        ];
    }

    public function messages(): array
    {
        return [
            'title.required'        => 'Job title is required.',
            'company_name.required' => 'Company name is required.',
            'logo.dimensions'       => 'Logo dimension must be 100×100 pixels.',
            'apply_link.url'        => 'Invalid URL.',
        ];
    }

}
