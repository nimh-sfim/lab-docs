# Resources for using Visual Studio Code

- [Overview](#overview)
- [VS Code General Guides](#vs-code-general-guides)
- [Extensions](#extensions)
- [VS Code on Biowulf](#vs-code-on-biowulf)

## Overview

Visual Studio Code is an Integrated Development Environment (IDE) that may support creating and version controlling code both locally and on Biowulf. We are recommending VS Code because several of us use it and can help new users in the lab. If you're already happy with another editor, stick with what works for you. Key benefits that VS Code and many other modern IDEs have include:

- Graphical interfaces that can help users do complex tasks if they haven't memorized the keyboard short-cuts from text editors, like vi or emacs or every git command
- Multi-colored text to distinguish things like variables, comments, & function calls
- Advanced editing and find/replace features
- Linters for multiple programming languages. A linter is essentially a grammar and style checker for code. If it's turned on, it will highlight errors and warnings in code so that you can more rapidly improve code clarity and identify potential mistakes
- Previews for rendered languages such as Markdown (.md), ReStructured Text (.rst), Graphviz flow charts (.dot), and HTML. This means you can create these documents and immediately view how the stylized versions will look.
- The ability to run code within the editor and possibly use advanced debugging features
- A Live Share extension where people can view and edit the same instance of the code together (potentially good for code reviews)
- The ability to do remote development. That is you have the graphic interface efficiently running on your local machine while all code and processing lives on a remote server, such as a Biowulf compute node.

## VS Code General Guides

- [Installing VSCode][vscode_install] - Includes instructions for adding VSCode to the PATH, so you can open VSCode from the command line and makes life easier when connecting to a compute node on Biowulf.
- [VS Code's Intro Docs & Videos][vscode_docs] are good general resources
- [VS Code and Git][vscode_git] for extensive details on how to use VSCode to interface with Git and GitHub
- [VS Code keyboard short cuts][keyboard_shortcuts]
- [VS Code key bindings for other editors][keybindings] for those who cannot live without your vi or emacs short cuts

## Extensions

One benefit of using VSCode is that you can add any number of extensions to customize your coding experience. The following are some extensions we suggest to make your life easier:

- Python, Plylance, and Python Debugger by Microsoft: Lots of useful python stuff including linting and other error checks, debugging tools including break points, etc.
- Jupyter, Jupyter Keymap, Jupyter Notebook Renderers by Microsoft: The three together help make a relatively smooth use of Jupyter Notebooks within VS Code
- Remote Development (bundles Remote - SSH and Remote - Containers): This is necessary to open VS code locally and remotely run programs on Biowulf.
- GitHub Pull Requests: Useful for interacting with a GitHub repo directly in VS Code. Particularly nice for comparing changes in pull requests, and committing & pushing new changes to a branch.
- GitLens: More advanced features for interacting with a git repo
- Linters and language support: Most common languages have extensions that will highlight errors or style warnings and color text in ways that make it easier to code. These extensions include
  - Flake8 (python formatting)
  - markdownlint
  - YAML
  - Matlab
  - LaTeX Workshop (also renders LaTex documents)
  - Rainbow CSV (colors colums in CSV or TSV files and allows for SQL-style queries)
  - "Remote - SSH: Editing Configuration Files"
  - reStructuredText Syntax highlighting: Colors text, but just "reStructuredText" is the linter
  - Subtitles Editor
  - XML
- There are extensions to render many visualization languages. For example, if you're editing markdown (.md) documentation, like this file, you can simultaneously type and view how the rendered text will look. Once that may be useful include:
  - reStructuredText (also does linting)
  - Graphviz Preview
- Live Share Extension Pack: Multiple people can simultanoues view and edit the same VS Code window (more interactive than sharing an editor window in Zoom)
- Docker: Interact with Docker containers in VS Code
- VisualStudio Intellicode: AI-based coding suggestions (Note, unlike GitHub Copilot, this should **not** send code (possibly with PII) into a cloud system for interpretation)

## VS Code on Biowulf

### Operating directly on a Compute Node

VS Code has some nice features for using with Biowulf. Noteably, with the [remote development][remote_development] extension, you can open a local copy of VS Code to save and edit scripts with no network lag, but, have scripts and command executions happen on a Biowulf node. Within VS Code, you can open a terminal window do anything on Biowulf. You can even open graphical programs like AFNI through VS Code, but that will be noticably slower compared to running them through TurboVNC.

VS Code runs a remote server on Biowulf, so, as long as you keep a compute node, you'll able to disconnect and reconnect to the network without affecting your working environment. If you're editing a script on your laptop, and it disconnects from the network, everything will be the same when you reconnect. Put another way, if you're doing work that involves a terminal and text editing, you can use VS Code instead of TurboVNC. You can also run Jupyter notebooks within VS Code [without tunneling][jupyter_guide].

[Here is a guide][vscode_biowulf_guide] to connecting directly to an interactive or persistent node on Biowulf and doing remote development. The key steps are to:

1. Install the `Remote Developer Extension` in VS Code [(link)][remote_extension].
1. Create an SSH key for logging into Biowulf (detailed in the [laptop setup guide][git_ssh])
1. Open your ssh config file on your Mac. Likely  `/Users/$username/.ssh/config` with $username being your user ID. In that file add (again with your user ID):

    ```properties
    Host cn*
    User $username
    ProxyCommand /usr/bin/ssh -o ForwardAgent=yes $username@biowulf.nih.gov nc -w 120ms %h %p
    ```

1. Start an spersist node on Biowulf and note the node number (i.e `cn2728`). Make sure you request the node in a place where it would remain active if you're internet disconnects. That is request the node through OnDemand or `tmux`
1. With the Remote Developer Exension installed, the bottom left corner of VS Code should be a symbol like `><` in blue or green. Clicking on it will let you `Connect Current Window to Host` or `Connect to Host` (which will open a new VS Code window). Type in just the node number that you got in the previous step (i.e. `cn2728`) to connect. **Note** that if you are asked to enter your passphrase multiple times, try to reconnect from a VSCode window that you have opened from a Terminal with SSH keys already added via `ssh-add` so that it inherits the various settings and environments necessary to use the keys.
1. There is an added issue with python environments on VS code. If you set conda or miniconda as your default python environment in your `~/.profile` then some programs won't function. That means you need to change to this environment later. When you open a python file in VS Code, it will either ask you to select your python interpreter or the current version will appear on the bottom right of the VSCode window. If you click on it your desired version should appear on that list or you can type the full path.

### GitHub and VS Code on Biowulf

- If you want to access private repositories through VS Code, you'll need to set up an SSH key for Git [(instructions)][git_ssh]. This is useful for both development on Biowulf and locally.
- In order to interact with GitHub repos when you're connected to a compute node on VSCode via the Remote Developer Extension, you must have added the following to `~/.ssh/config` on Biowulf, replacing `$username` with your Biowulf username. Note that for this to work, the repository must be cloned using `https` not `ssh`.

```SSH Config
Host github.com
  User git
  ProxyCommand /usr/bin/ssh -o ForwardAgent=yes $username@biowulf.nih.gov nc -w 120ms %h %p
```

- Additional instructions on getting GitHub to play well on Biowulf are in the [HPC guide]

[remote_development]: <https://code.visualstudio.com/docs/remote/remote-overview>
[vscode_install]: https://code.visualstudio.com/docs/setup/mac
[jupyter_guide]: <https://hpc.nih.gov/apps/jupyter.html>
[vscode_biowulf_guide]: <https://hpc.nih.gov/apps/vscode.html>
[HPC guide]: hpc.md#Using-git-on-biowulf
[remote_extension]: <https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack>
[git_ssh]: <https://github.com/nimh-sfim/lab-docs/blob/main/set_up_laptop.md#set-up-ssh-keys>
[vscode_docs]: <https://code.visualstudio.com/docs>
[keyboard_shortcuts]: <https://code.visualstudio.com/docs/getstarted/keybindings#_keyboard-shortcuts-reference>
[keybindings]: <https://code.visualstudio.com/docs/getstarted/keybindings>
[vscode_git]: https://code.visualstudio.com/docs/sourcecontrol/overview
