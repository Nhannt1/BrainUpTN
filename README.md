PROJECT SETUP - BrAIn Up
======================

*Project Name:* BrAIn Up

*Description:*  
The application uses AI to summarize textbooks, create flashcards, review questions and support conversational learning, extremely useful for students.

Outstanding features:
- Take a photo of a book page → AI summarizes + creates flashcards

- Chat with the AI ​​assistant to review lessons

- Automatically create review outlines before exams

- Support voice learning (voice Q&A)

Initial Setup
-------------

1. Contact the *Team Lead* to obtain:
   - The `.env` configuration folder  
   - The Android keystore file

2. Run the following command to install dependencies:
<pre>
make build_runner
</pre>


GIT FLOW RULES
==============

A clean and consistent Git flow improves teamwork and tracking.


Task Branches
-------------

*Branch name format:*  
<pre>
task/task_id_short_description
</pre>

*Example:*  
<pre>
task/90_create_account_ui
</pre>

*Commit message format:*  
<pre>
[Task] Capitalized short description
</pre>

*Example:*  
<pre>
[Task] Create account UI
</pre>


Bug Fix Branches
----------------

*Branch name format:*  
<pre>
bug/bug_id_short_description
</pre>

*Example:*  
<pre>
bug/91_fix_bug_home_ui
</pre>

*Commit message format:*  
<pre>
[Bug] Capitalized short description
</pre>

*Example:*  
<pre>
[Bug] Fix bug home UI
</pre>


Summary
-------

* Task  
  - Branch: task/id_description  
  - Commit: [Task] Capitalized description  

* Bug  
  - Branch: bug/id_description  
  - Commit: [Bug] Capitalized description
