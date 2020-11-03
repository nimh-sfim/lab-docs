# Editing this Repository

We will need to maintain this repository to keep everything up to date.
This document should be used as guidance for making changes in this
repository.

## Steps
In general, there are several distinct steps to take:
1. Identify a problem that should be solved.
1. Explain the problem in the [issues][1].
1. In the issue opened, detail a solution to the problem.
1. Create a pull request (more below) with the solution.
1. Undergo review for the pull request.

## Creating a Pull Request
There are two basic methods of making a pull request:
1. Using the GitHub UI
1. Using a local Git configuration

### Option One: Using the GitHub UI
The GitHub UI allows a very basic editor and workflow, best suited for small
typos or similar small edits.
It is not recommended to use the UI for a more complex set of changes,
such as those that span multiple files.
In order to use the UI to make edits, such as to README.md, navigate to the
file you'd like to edit and press the pencil icon.

![The Edit Button](/static/github_ui/edit_button.png)

Once you press it, an editing window will open in the same tab, allowing you
to make changes to the file.
You can edit the text in markdown format in the Editing Window, view how
it will appear in the Formatting Preview, and then write text to describe 
your changes in the Commit Text.
Finally, create a new branch and open a pull request.

![Editing](/static/github_ui/editing_window.png)

Once you're happy with these edits and their descriptions, it should look
something like the below.

![Finished Edits](/static/github_ui/edit_complete.png)

Click "Propose Changes" and you will be guided to a window to begin making a
pull request.

### Option Two: Using a Local Git Configuration
1. Create a new branch from main.
1. Make your changes.
1. Push your branch to the repository.
1. Open a Pull Request with the link GitHub provides.

### Submitting the Pull Request
Whether you use the UI or a local Git configuration, you should see a window
asking you to open the pull request.

![Opening a Pull Request](/static/github_ui/open_pr.png)

GitHub will use your commit subject to fill out the PR title.
The PR body will be available for you to add more details.
At a minimum, please state which issue will be closed by this pull request.
The drop-down arrow, labeled in the below figure as "Additional Options,"
allows you to make this pull request a "draft" pull request.
A draft pull request means that you're not quite ready for other people to
review your changes, and you'd like to keep making them.
Regardless of whether your pull request is ready or not, click "Create Pull
Request" to open it.

## Undergo Review
People may ask you to make changes.
Please engage with the reviewers and make sure that you work together
towards the most clear documentation possible.
You may need to use a local Git repository to keep making changes.
When your pull request is approved, one of the staff will merge it.
