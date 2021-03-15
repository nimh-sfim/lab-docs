## Git Resources
Please see below for curated Git Resources.

### Recommended Reading
- [Git Primer][1]: Brief primer that may help orient a new user terminology
- [Pro Git][2]: chapters 1 through 3.
- [The Turing Way][3]: "Version Control" (also includes version control for
data).

- [Creating SSH Keys](creating-ssh-keys)
- [Software Carpentry][4]: "Version Control With Git."
- [Jupyter and Git][jupyter_git]

### Git Training
We have supplementary questions and answers to go with Pro Git [here][5].


### Creating SSH Keys
Creating SSH keys allows you to easily authenticate to GitHub in order to
pull and push changes without having to enter your username and password
every time.
You'll need to set up one key pair per machine (e.g., one for your local
machine, one for biowulf, etc.)
We recommend following GitHub's instructions [here][ssh-keys] to create SSH
keys.
Please create and remember your SSH key password!
You will only need to enter it ocassionally.

Once you've created your key locally, you will need to associate it with
your GitHub account.
You can use GitHub's instructions [here][gh_affiliate].
Make sure that once you've set up your SSH keys, your remotes are set up to
use the SSH addresses rather than HTTPS.
You can do this by going to the repository, clicking on the "code" tab, and
then pressing the "code" drop-down menu.
Click "SSH" and then the clipboard icon to copy the new link.
Then, for each remote, run
```
git remote remove NAME
git remote add NAME NEW_LINK
```
and you will be set up to use SSH keys.

Keep in mind that each SSH key pair is associated with only one machine.
If you change machines or take ownership on a new one, you will need a new
SSH key pair.

[1]: <https://voyteklab.com/git/git-primer/> "Voytek Lab Git Primer"
[2]: <https://git-scm.com/book/en/v2> "Pro Git"
[3]: <https://the-turing-way.netlify.app/reproducible-research/vcs.html> "The Turing Way, Version Control"
[4]: <http://swcarpentry.github.io/git-novice/> "Version Control With Git"
[jupyter_git]: <jupyter_git.md> "Jupyter and Git"
[5]: <pro_git_supplement/pro_git_supplement.md> "Pro Git Supplement"
[gh_affiliate]: <https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>
[ssh-keys]:<https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>