### Undoing Things

#### Questions for Understanding
1. Should you amend a commit if it has been pushed somewhere else?
1. Does unstaging a file change its contents in the working directory?
1. In which version of Git was `restore` introduced?
1. Are changes made with
   ```
   git checkout -1. FILE
   ```
   or
   ```
   git restore FILE
   ```
   recoverable?

#### Exercises
1. Make a commit with a typo, such as "I lik cookies."
   Then, fix the typo and amend the commit.
   Try the same with a typo in the commit message itself.
   What do you notice about the commit hash afterwards?
1. Stage a commit with some typo.
   Correct the typo incorrectly,
   such as "I lik cookies" to "I likee cookies."
   Then try
   1. Discarding the second typo and
   1. Unstaging the first.
   Note how after the unstage operation, the typo remains.

#### Navigation
[Previous][c2_3]

[Next][c2_5]

[Contents][c2]

[c2_3]: <chapter_2_2.md>
[c2_5]: <chapter_2_5.md>
[c2]: <../pro_git_supplement.md>
