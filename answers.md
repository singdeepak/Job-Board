1. How does Laravel FormRequest help in validating inputs?
It keeps the controller clean. I write all the validation rules in one place and Laravel handles the rest automatically.

2. How did you handle file upload and make logos accessible?
I store the file in the public folder and save the path in the database. Then I use asset() to show the logo on the website.

3. What’s the difference between middleware and policies in Laravel?
Middleware checks the request before it reaches the controller, like if the user is logged in. Policies control who can do what with a model, like edit or delete.

4. What is the purpose of the custom Artisan command in your app?
I used it to automate tasks like sending reports or cleaning old data. It saves time and works with the scheduler.

5. If given more time, what feature would you add next and why?
I would like to add inot this multi auth with multi vendor so that more than one user or admin can add their job, and that job sould show in public access. Also I will add email trigger when you apply, you will get an email, status tractor etc.