# Workflows for SFIM

These are our recommended workflows, in ascending order of complexity.
More collaborative projects will require more complex workflows in order to
accomodate more contributors.

1. [Simple Tracking](#simple-tracking)
1. [Collaborative Branching](#collaborative-branching)
1. [Advanced Collaboration](#advanced-collaboration)

## Simple Tracking

### Overview
In this workflow, you do not use any branches.
This is suitable for somebody who does not have any collaborators, and wants
to keep their code and workflow simple.
A good example of this workflow would be for a one-off script that you
almost certainly won't use again, but want tracked just in case.

### Starting the Repository
Starting the repository will depend on whether or not your code already
exists or if you're planning on making it after creating the repository.
We recommend making the repository first where possible, since it makes you
more likely to keep your code under version control.
The steps of the workflow are:
1. Create an issue to for work to be done.
1. Do local work, commit and push regularly (recommended: daily).
1. Close issues as your commits address them.

#### Code Exists
If your code already exists:
1. Make a new repository on [GitHub][gh_newrepo], but DO NOT "Initialize 
   this repository with a README"
1. Enter your code's directory and run
   ```
   git init
   ```
1. Run
   ```
   git add --all
   git commit -m "Initial commit"
   ```
1. Follow directions for "push an existing repository from the command line.

   ---
   **NOTE**

   The default branch on GitHub is `main`, but the default in Git is
   `master` unless you set the default branch to `main`.
   Following the GitHub instructions will make your `master` branch become
   `main` instead.
   We recommend this.

   ---

#### Code Does Not Exist
If your repository does not exist already
1. Make a new repository on [GitHub][gh_newrepo], and "Initialize this 
   repository with a README"
1. Follow instructions to [clone your GitHub repository][gh_clone].

### Maintaining Changes
As you run into to-do items, file them as [issues][gh_issues] in your GitHub
repository.

---
**NOTE**

Issues can be used for more than just things to be "fixed;" they can
also be used to organize things that you'd like done but aren't implemented
yet.

---

As you address things locally, be sure to commit your changes via
```
git add [FILES]
git commit -m "Helpful message less than 50 characters"
```
Regularly push, ideally every day, to your remote with
```
git push
```
and close issues as commits address them.

## Collaborative Branching
If working with others, even if they are just reviewing with your code, it
is best to use branching workflows to make it easier to review.
By using a branching workflow, it is easy to get reviews or regular feedback
for your project.
The steps of the workflow will be:
1. Create an issue for work to be done.
1. Branch off of main.
1. Create pull request, optionally as a draft.
   If draft, also do the below:
   1. Commit and push until the issue is addressed.
   1. Mark the pull request "ready for review" and request reviewers.
1. Request reviewers and allow them to review.
1. Address reviews
1. Merge the pull request, clean up the branches.
See section [starting a repository](#starting-a-repository) above for
instructions on making a repository.

### Create an Issue
In collaborative workflows, it's important to articulate the work to be done
clearly and (ideally) concisely.
Use a helpful title to make the issue easy to find weeks later, when you've
forgotten what the precise problem or to-do was.
In the body of the issue, consider adding a checklist for the sub-tasks that
need to be handled in order to completely address the problem.
Consider tagging lab members to solicit opinions if you're unsure of how to
proceed.

### Branch off of Main
The default branch, `main`, should only contain "complete" work.
Anything in progress should go to another branch.
This will also make it very easy to open pull requests and keep repositories
well-organized.
In order to branch off of `main`,
you can use
```
git checkout main
git checkout -b NEW
```
with NEW the new branch name.
Ideally, your branch name should be descriptive but very short.
Any new commits you make here will go onto the new branch.
Once you make some changes, you should push your new branch via
```
git push -u origin NEW
```
with NEW the new branch name.
GitHub will spew out some information, including a very helpful message
saying "To open a pull request..." with an `https://github.com` link.
Copy the link and paste it into your browser to begin opening the pull
request (PR).

### Create a Pull Request
If you haven't already, you should read GitHub's documentation on
[pull requests][gh_pr].
If your pull request is already ready for someone to review it, go ahead and
open the pull request with "Create Pull Request."
If not, click the drop-down arrow and select "Create Draft Pull Request."
Make sure your title and body are descriptive, and that you put
```
Closes issue #N
```
at the top, with `N` the appropriate issue number.
If your PR will close multiple issues, separate them with commas and spaces.

#### Commit and Push Until the Issue is Addressed
If a draft PRis opened, continue making changes on your branch.
Push them by simply running `git pull`.
The PR will update the changes automatically with each push.
Feel free to use the PR comments to solicit feedback on your pushed work.
If you reference a short commit hash in the PR conversation, a hyperlink
will direct users to the relevant commit.

#### Mark the Pull Request "Ready for Review"
For a draft PR, once you're sure that you're ready for others to review it,
go ahead and mark your PR "ready for review."
This will make the PR no longer a draft, and make it clear that you'd like
for others to review it.

### Request Reviewers
Use the reviewer corner of the PR interface to request reviewers.
Choose people who you are collaborating with on the project.
If unsure, ask Josh to review it.

---
**NOTE**

Josh is to some degree paid to review SFIM programming.
You shouldn't hesitate to tag him to review things, because it's much easier
to catch bugs *before* they happen.
He may be slow (a disclaimer that Josh will point to) but if he takes too
long you are welcome to tag him in comments with passive aggresssive
messages like "Really looking forward to your review!
It must be good if it's taking this long!"

---

### Address Reviews
Reviewers will then review your PR.
If they make a suggestion, you can directly commit it.
If you do this, you'll need to update your local branch via
```
git fetch origin NEW
git merge origin/NEW
```
and potentially resolve merge conflicts before pushing back to the branch.
Reviewers may ask questions or have you modify the code some more before
they are satisfied.
If reviewers request changes and you address them, you can re-request their
review.

### Merge Pull Request
When you have your reviewers approve your review, you should merge your PR.
If your PR is a standalone change, you should "Squash and Merge" the PR,
which will allow you to condense all commmits into just one that will be
merged.
If your PR is more complex, you'll want to use a simple merge.

## Advanced Collaboration
For complex projects, you may need several people working together on the
same branch or many simultaneous PRs.
A high degree of Git proficiency is required for this workflow.

In these situations, the following setup is recommended:
1. Host a central repository for the `main` branch and collaborators to open
   PRs to.
1. Use a personal fork to push your own changes to.

The recommended workflow is:
1. Open issues on the central repository for the various collaborators to
   discuss changes.
1. Follow the workflow from "Collaborative Branching," except with branches
   pushed to your fork instead.
1. Regularly integrate the upstream into your fork, including your branches
   for works in progress.

### Open Issues on the Central Repository
In larger projects, it's likely that there will need to be issue labels to
keep things more organized.
When opening issues, do searches to make sure that you are not duplicating
existing issues.
Keep in mind that communicating changes with larger groups can be more
difficult than with just a few individuals working closely on a project.

### Branch and Open PRs
This is very similar to the "Collaborative Branching" workflow, however,
you will actually have two remotes.
The central repository will be `upstream`, which you can set with
```
git remote add upstream URL
```
and `origin` will be your fork.
Push changes to your fork, and use the URL.
However, this time, the URL will direct you to make the PR on the upstream
rather than your fork.
One additional change to consider is that when your PR is approved, you can
use the [interactive rebase][irebase] Git feature to make your branch
"cleaner" before it is merged.

---
**NOTE**

The interactive rebase will rewrite your git history!
Proceed with *extreme caution* and only do this if you're sure that you know
what you are doing!

---

Different projects will have different needs, but for larger projects it is
recommended to clean things up locally, and then "rebase and merge" in the
GitHub UI to make a cleaner commit history for larger changes.
For smaller changes, a squash and merge with a clear commit messages may be
preferable.

### Regularly Integrate Upstream
This is relatively straightforward.
You will want to update your local repository to be up to date in any of the
following conditions:
1. You're starting or ending your day working with the repository.
1. You're about to start a new branch.
1. You want a new feature in the upstream to be integrated.
In order to update things, you should use
```
git fetch upstream main
git merge upstream/main
```
while on the branch which you'd like to integrate the changes into.

[gh_newrepo]: <https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/create-a-repo>
[gh_clone]: <https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/cloning-a-repository>
[gh_issues]: <https://guides.github.com/features/issues/>
[gh_pr]: <https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request>
[irebase]: <https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History>
