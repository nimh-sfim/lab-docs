# Resources for using VSCode

Visual Studio code is an Itegrated Development Environment (IDE) that may support creating and version controlling code both locally and on biowulf. Key benefits that VSCode and many other modern IDEs have include:

* Graphical interfaces that can help users do complex tasks if they haven't memorized the keyboard short-cuts from text editors, like vi or emacs or every git command
* Multi-colored text to distinguish things like variables, comments, & function calls
* Advanced editing and find/replace features
* Linters for multiple programming languages. A linter is essentially a grammar and style checker for code. If it's turned on, it will highlight errors and warnings in code so that you can more rapidly improve code clarity and identify potential mistakes
* Previews for rendered languages such as Markdown (.md), ReStructured Text (.rst), Graphviz flow charts (.dot), and HTML. This means you can create these documents and immediate view how the stylized versions will look.
* The ability to run code within the editor and possibly use advanced debugging features
* A Live Share extension where people can view and edit the same instance of the code together (potentially good for code reviews)
* The ability to do remote development. That is you have the graphic interface effiently running on your local machine while all code and processing lives on a remote server, such as a Biowulf compute node.

## Remote development with VSCode

With a [remote development environment on VSCode][remote_development] you can essentially do anything on biowulf except open a graphical interface for another program like AFNI. VSCode runs a remote server on Biowulf, just like NoMachine so, as long as you keep a compute node, you'll able to disconnect and reconnect to the network without affecting your working environment. Put another way, if you're doing work that involves a terminal and text editing, you can use VSCode instead of NoMachine. You can also run Jupyter notebooks within VSCode [without tunneling][jupyter_guide]. Here are the steps to get VSCode remote development working with biowulf.

[This is the general guide][vscode_biowulf_guide] for setting up VSCode on Biowulf. There are several steps that are not currently obvious in that guide.

1. Follow the instructions there on setting up an [SSH key for biowulf][ssh_key]. This will also let you log onto biowulf without typing your password each time
1. Add the [Remote Development Extension][remote_extension] to VSCode
1. Follow the instructions on the general guide for editing your SSH config file so that a host beginning with `cn*` is recognized
1. When you request a compute node using `spersist` or `sinteractive`, make sure it's requested somewhere that won't disconnect if your computer disconnects from the internet (i.e. using NoMachine or `tmux`)
1. In VS code, the button to select a remote host is the green button in the bottom left corner with a `><` symbol. From there you can `Connect Current Window to Host` or `Connect to Host` (which will open a new VSCode window). You can just need to type in the computer node number (i.e. cn24601) to connect.

There are additional issues for getting git to work with VSCode, particularly since the default version of git on biowulf is really old.

* VSCode does not recognize `module load git` so you need to directly update `git` in your path on biowulf. On biowulf, add the most up-to-date version of git on the system into your `~/.profile` This can currently be done with the line

    ```bash
    export PATH=/usr/local/git/2.31.1/bin:$PATH
    ```

    If you go to `/usr/local/git/` you'll be able to see the most recent version. It's not clear if there's a way to automate finding the most up-to-date version that's worth the hassle. If you get too out-of-date, they might remove a git version and you'll revert to the default git version on biowulf.  
* If you want to access private repositories through VSCode, you'll need to set up an ssh key for git [(instructions)][git_ssh]
* On biowulf add the following to `~/.ssh/config` with your username

    ```
    Host github.com
      User git
      ProxyCommand /usr/bin/ssh -o ForwardAgent=yes username@biowulf.nih.gov nc -w 120ms %h %p
    ```

* When you clone a repository use `https` not `ssh` if you want to be able to access github from a biowulf compute node

There is a similar issue with python environments on VScode. If you set conda or minicoda for your default python environment in your `~/profile` then NoMachine and some other programs won't function. That means you need to change to this environment later. When you open a python file in VSCode, it will ask you to select your python interpreter and your version should apear on that list. I'm not sure if there's a way to set the default interpreter in VSCode that's different from the default when you log onto biowulf.

## Suggested Exentions

(Still need to add explanations)

* Anaconda Extension Pack
* GitHub Pull Requests
* Jupyter
* markdownlint
* Python (may be included with Anaconda)
* Live Share
* Rainbow CSV
* reStructuredText
* VisualStudio Intellicode

[remote_development]: <https://code.visualstudio.com/docs/remote/remote-overview>
[jupyter_guide]: <https://hpc.nih.gov/apps/jupyter.html>
[vscode_biowulf_guide]: <https://hpc.nih.gov/apps/vscode.html>
[ssh_key]: <https://hpc.nih.gov/docs/sshkeys.html>
[remote_extension]: <https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack>
[git_ssh]: <https://github.com/nimh-sfim/lab-docs/blob/main/git.md#creating-ssh-keys>
