### Recording Changes to the Repository

#### Questions for Understanding
- If you add a file to an empty repository, is it tracked or
    untracked?
- Can you add folders with the `git add` command?
- When running `git status`, you can see that a file has been
    modified with changes to be committed, \emph{and} modified with
    changes not staged for commit. What happened?
- When running `git status -s`, what is the left column? The
    right?
- What expression would you use to ignore all `.pdf` files in a
    repository in the `.gitignore`?
- What's the difference between `git diff` and `git diff --cached`?
- If you use `git commit` with no arguments, when does the
    commit get created?
- If you modify a file or stage it, and then attempt to remove it
    with `git rm`,which flag must you add?
- To stop tracking a file but retain it in the working area, what
    flag must you add to `git rm`?
- Does git track whether files are renamed?

#### Exercises
 Throughout the exercises, it is recommended that you routinely run
`git status` in order to see how the repository views your changes.
Exercises should be done in order.
- Go to your recipes repository, which you made in the last chapter.
  Create a file called `README.txt`, and put a brief message in
  it, perhaps, ``I like cookies.'' Stage, and then commit, the file.
- Create a file, `cookies.txt`, and add some ingredients to it.
  Stage the changes.
  Then, go back to the file and add cooking instructions.
  Commit your changes, stage the remaining ones, and then commit them.
  This exercise is to reinforce the nature of the working and stagin
  areas.
- Create a file, `ignoreme.txt`, and set up the repository to
  ignore it.
  (Hint: you will need to commit changes to the `.gitignore`).
  Commit the changes to the `.gitignore`.
  Check the working area and `git status` to verify that the file
  is present, but ignored by the repository.
- Set up the repository to ignore all `.pdf` and `.docx`
  files.
- Create a file, `hello.txt`, with ``Hello, world!'' in it,
  and then commit it. Stop tracking it without deleting the file from
  disk.
  What does the status say after you do so?
  After checking, unstage the change.
- Change `hello.txt` to `hello_world.txt` without usin
  `git mv`.
  Then, change it back using `git mv`.

#### Navigation
[Previous][c2_1]
[Next][c2_3]
[Chapter][c2]

[c2_1]: <chapter_2_1.md>
[c2_3]: <chapter_2_3.md>
[c2]: <chapter_2.md>
