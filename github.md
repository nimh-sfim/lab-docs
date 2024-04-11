# How to: Set up and use a GitHub repo

As a lab, we want to be using version control to keep track of and share the work we do. This is important for a few reasons:

1. It allows us to share the work that we do with the broader scientific community
2. It helps us keep track of what we're doing and the changes we make as we do science
3. As per our official data management plan, we're required to.

If you're new to using Git/GitHub (or just want a refresher), check out the various tutorials and links in the Git section of the [Education page][education] in this repo. Also feel free to ask your friendly neighborhood Programmer for help if you want support!

---

On this page, you will find information about:

- [Setting up a repo](#set-up-the-repo)
- Working on code via 3 example workflows:
  - [A simple workflow](#a-simple-workflow)
  - [A collaborative workflow](#working-collaboratively)
  - [Advanced collaborative workflows](#advanced-collaboration)

Other points of interest on this page:

- [Notes about Jupyter Notebooks and GitHub](#note-github-and-jupyter-notebooks)

## Set up the repo

First, work with the Scientific Programmer to set up a new repo on the `nimh-sfim` GitHub account. This can be be private to start, but keep in mind this will eventually be made public.

### Link the repo to your codebase

Enter your code's directory and run:

``` bash
git init
```

This will initalize Git in your directory and enable you to start tracking your changes. However, you still need to tell Git where to look for the GitHub repo. To do so, you should run the following code:

``` bash
git remote set-url origin URL_FOR_YOUR_REPO
```

You can get the URL for your repo by clicking on the green `Code` button at the top of the repo (see the [GitHub instructions][gh_clone] for more details). Since you should have already set up an SSH Key for GitHub (see the [Setting up your laptop page][setting_up_laptop] if you have not already done so), so you should make sure you use the SSH option for the URL (not the HTTPS one).

You can verify that the remote was set appropriately by running `git remote -v`.

### Set up a .gitignore

Before you do your first commit, it's helpful to set up a `.gitignore`. This will tell Git if there are files it should systematically ignore. For instance, you might want to ignore large data files (since Git has a file size limit) or things with PII in them. You also might want to ignore Jupyter Notebook Checkpoints, for example. GitHub has pulled together example .gitignore templates [here][gh_gitignore], so take a look around for your desired language template and just copy that into your repo.

**NOTE** If you forget to add a file in your `.gitignore`, commit it, and then add it to the `.gitignore` later, the commits will still exist on GitHub, the file just won't be tracked after that point. This can be a major pain (or a more serious issue, depending on what gets committed that wasn't supposed to be), so it's easier just to nip problems in the bud and add the `.gitignore` right off the bat so you don't forget it.

## Working on code

From there, you can start working on your code. Using version control is only as useful as you commit your changes, so you should be committing your changes and pushing them to GitHub regularly. A good rule of thumb for commits is that they should be completed changes that are related to a single issue (see [GitHub's best practices][gh_commits] for commits for more disscussion on how to make good commits).

Once you have done some work and you think you're ready to make a commit, run:

``` bash
git add --all
git commit -m "Initial commit"
```

### A simple workflow

If you're just working by yourself, feel free to just commit on the `main` branch as you make changes and push them to your repo. You don't necessarily have to push every time you make a commit, but you should try to do it at least once a day, or whenever you're making a new branch. You can do this by running the following commands:

```bash
git add [FILES] # stage your files to be added
git commit -m "Helpful message less than 50 characters" # commit the changes and add a helpful message so you can remember what you did
git push # push your changes from your local version to your remote. 
```

Even if you're working by yourself, you might want to consider using branches to help organize different analyses as you work on your code. See [below](#branch-off-of-main) for details on how to work with branches.

---

#### NOTE: GitHub and Jupyter Notebooks

Github does not play super well with jupyter notebooks. You can absolutely track them like you would any other file, but it will have trouble doing diffs and telling you what changed. One way to handle this is by using `jupytext`, which can be downloaded through conda.

``` bash
conda install -c conda-forge jupytext
```

From there, work on your code as you normaly would. When you're ready to commit, run the following command (replacing `notes.ipynb` with the actual name of your notebook):

```bash
jupytext --to py notes.ipynb
```

You can commit the resulting file (`notes.py`), but DO NOT commit the `.ipynb` file - in fact, you may wish to add `*.ipynb` to your `.gitignore` file for your project. This process should be repeated every time you want to commit a Jupyter Notebook.

If you're looking to convert a `.py` file back to a `.ipynb` notebook, you can run the following command:

```bash
jupytext --to ipynb notes.py
```

---

### Working Collaboratively

If you're working collaboratively, it is best to use branching workflows to make sure everything is organized. In general, a collaborative workflow might look like:

1. Create an issue for work to be done.
1. Branch off of main.
1. Create pull request, optionally as a draft. If draft, also do the below:
    1. Commit and push until the issue is addressed.
    1. Mark the pull request "ready for review" and request reviewers.
1. Request reviewers and allow them to review.
1. Address reviews
1. Merge the pull request, clean up the branches.

#### Create an Issue

In collaborative workflows, it's important to articulate the work to be done clearly and (ideally) concisely. Use a helpful title to make the issue easy to find weeks later, when you've forgotten what the precise problem or to-do was. In the body of the issue, consider adding a checklist for the sub-tasks that need to be handled in order to completely address the problem.
Consider tagging lab members to solicit opinions if you're unsure of how to proceed.

#### Branch off of Main

The default branch, `main`, should only contain "complete" work. Anything in progress should go to another branch.
This will also make it very easy to open pull requests and keep repositories well-organized.
In order to branch off of `main`, you can use:

```bash
git checkout main
git checkout -b NEW
```

with NEW being the new branch name. Ideally, your branch name should be descriptive but very short.
Any new commits you make here will go onto the new branch. Once you make some changes, you should push your new branch via

```bash
git push -u origin NEW
```

with NEW being the new branch name.
GitHub will spew out some information, including a very helpful message saying "To open a pull request..." with an `https://github.com` link. Copy the link and paste it into your browser to begin opening the pull
request (PR).

#### Create a Pull Request

If you haven't already, you should read GitHub's documentation on
[pull requests][gh_pr]. If your pull request is already ready for someone to review it, go ahead and
open the pull request with "Create Pull Request."

If not, click the drop-down arrow and select "Create Draft Pull Request."
Make sure your title and body are descriptive, and that you put

`Closes issue #N` at the top, with `N` the appropriate issue number. If your PR will close multiple issues, separate them with commas and spaces.

Once you have made your draft PR, continue making changes on your branch.
Push them by simply running `git push`. The PR will update the changes automatically with each push.
Feel free to use the PR comments to solicit feedback on your pushed work.
If you reference a short commit hash in the PR conversation, a hyperlink will direct users to the relevant commit.

When you're ready for others to review it, go ahead and mark your PR "ready for review." This will make the PR no longer a draft, and make it clear that you'd like
for others to review it.

#### Request Reviewers

Use the reviewer corner of the PR interface to request reviewers. Choose people who you are collaborating with on the project.
If unsure, ask a scientific programmer or another SFIM member to review it.

#### Address Reviews

Reviewers will then review your PR. If they make a suggestion, you can directly commit it.
If you do this, you'll need to update your local branch via

```bash
git fetch origin NEW
git merge origin/NEW
```

and potentially resolve merge conflicts before pushing back to the branch.
Reviewers may ask questions or have you modify the code some more before
they are satisfied.
If reviewers request changes and you address them, you can re-request their
review.

#### Merge Pull Request

When you have your reviewers approve your review, you should merge your PR.
If your PR is a standalone change, you should "Squash and Merge" the PR,
which will allow you to condense all commmits into just one that will be
merged. If your PR is more complex, you'll want to use a simple merge.

### Advanced Collaboration

For complex projects, you may need several people working together on the
same branch or many simultaneous PRs. A high degree of Git proficiency is required for this workflow, so ask for help if you need it.

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

#### Open Issues on the Central Repository

In larger projects, it's likely that there will need to be issue labels to
keep things more organized.
When opening issues, do searches to make sure that you are not duplicating
existing issues.
Keep in mind that communicating changes with larger groups can be more
difficult than with just a few individuals working closely on a project.

#### Branch and Open PRs

This is very similar to the "Collaborative Branching" workflow, however,
you will actually have two remotes.
The central repository will be `upstream`, which you can set with

```bash
git remote add upstream URL
```

and `origin` will be your fork.
Push changes to your fork, and use the URL.
However, this time, the URL will direct you to make the PR on the upstream
rather than your fork.
One additional change to consider is that when your PR is approved, you can
use the [interactive rebase][irebase] Git feature to make your branch
"cleaner" before it is merged.

**NOTE**
The interactive rebase will rewrite your git history!
Proceed with *extreme caution* and only do this if you're sure that you know
what you are doing!

Different projects will have different needs, but for larger projects it is
recommended to clean things up locally, and then "rebase and merge" in the
GitHub UI to make a cleaner commit history for larger changes.
For smaller changes, a squash and merge with a clear commit messages may be
preferable.

#### Regularly Integrate Upstream

This is relatively straightforward.
You will want to update your local repository to be up to date in any of the following conditions:

1. You're starting or ending your day working with the repository.
1. You're about to start a new branch.
1. You want a new feature in the upstream to be integrated.

In order to update things, you should use

```bash
git fetch upstream main
git merge upstream/main
```

while on the branch which you'd like to integrate the changes into.

[education]:<education.md>
[setting_up_laptop]:<set_up_laptop.md>
[gh_gitignore]: https://github.com/github/gitignore
[gh_clone]: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository
[gh_commits]: https://gist.github.com/luismts/495d982e8c5b1a0ced4a57cf3d93cf60
[gh_pr]: <https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request>
[irebase]: <https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History>
