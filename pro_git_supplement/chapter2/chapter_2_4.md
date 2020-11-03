### Undoing Things

#### Questions for Understanding
- Should you amend a commit if it has been pushed somewhere else?
- Does unstaging a file change its contents in the working directory?
- In which version of Git was `restore` introduced?
- Are changes made with
  ```
  git checkout -- FILE
  ```
  or
  ```
  git restore FILE
  ```
  recoverable?

#### Exercises
- Make a commit with a typo, such as "I lik cookies."
  Then, fix the typo and amend the commit.
  Try the same with a typo in the commit message itself.
  What do you notice about the commit hash afterwards?
- Stage a commit with some typo.
  Correct the typo incorrectly,
  such as "I lik cookies" to "I likee cookies."
  Then try
  - Discarding the second typo and
  - Unstaging the first.
  Note how after the unstage operation, the typo remains.

#### Navigation
[Previous][c2_3]

[Next][c2_5]

[Contents][c2]

[c2_3]: <chapter_2_2.md>
[c2_5]: <chapter_2_5.md>
[c2]: <../pro_git_supplement.md>
