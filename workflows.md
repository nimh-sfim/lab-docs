# Workflows for SFIM

These are our recommended workflows, in ascending order of complexity.
More collaborative projects will require more complex workflows in order to
accomodate more contributors.

1. [Simple Tracking](#simple-tracking)
1. [Collaborative Branching](#collaborative-cranching)
1. [Advanced Collaboration](#advanced-collaboration)

## Simple Tracking

### Overview
In this workflow, you do not use any branches.
This is suitable for somebody who does not have any collaborators, and wants
to keep their code and workflow simple.
A good example of this workflow would be for a one-off script that you
almost certainly won't use again, but want tracked just in case.

### Simple Tracking: Starting the Repository
Starting the repository will depend on whether or not your code already
exists or if you're planning on making it after creating the repository.
We recommend making the repository first where possible, since it makes you
more likely to keep your code under version control.

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

As you address things locally, be sure to commit your changes.
Regularly push to your remote with
```
git push
```
and close issues as commits address them.

[gh_newrepo]: <https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/create-a-repo>
[gh_clone]: <https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/cloning-a-repository>
[gh_issues]: <https://guides.github.com/features/issues/>
