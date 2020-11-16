## Git Resources
Please see below for curated Git Resources.

### Recommended Reading
- [Pro Git][1]: chapters 1 through 3.
- [The Turing Way][2]: "Version Control" (also includes version control for
data).
- [Software Carpentry][3]: "Version Control With Git."
- [Creating SSH Keys](creating-ssh-keys)

### Git Training
We have supplementary questions and answers to go with Pro Git [here][4].

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

[1]: <https://git-scm.com/book/en/v2> "Pro Git"
[2]: <https://the-turing-way.netlify.app/reproducible-research/vcs.html> "The Turing Way, Version Control"
[3]: <http://swcarpentry.github.io/git-novice/> "Version Control With Git"
[ssh-keys]:<https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>
[4]: <pro_git_supplement/pro_git_supplement.md> "Pro Git Supplement"
