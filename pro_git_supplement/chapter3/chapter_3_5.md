### Branching Workflows

#### Questions for Understanding
1. What flag do you use to override the default name `origin` when running
   `git clone`?
1. Why might there be several remotes for a project?
1. State the difference between the following:
   ```
   git checkout -b branch remote/branch
   ```
   and
   ```
   git checkout --track remote/branch
   ```
   and then explain why you might choose one over the other.
1. According to the text, it is preferable to use `fetch` and `merge`
   rather than `pull` by itself.
   Why might it be confusing to use `pull`?

#### Exercises
Do exercises in order in the recipes repository.
1. Create a remote repository and add it as a remote.
   Call it `test`.
   1. Create a branch, `eggs`, and put a recipe for scrambled eggs on it.
      Push it to `test`.
   1. Checkout to `main` and create a new branch, `fried_eggs`.
      Push it to `test`.
   1. Delete your local `eggs` and `fried_eggs` branches, then fetch them
      from `test`.
      Note: the ability to do this is one of the strengths of `git`.
   1. Merge `eggs` and `fried_eggs` into `main`, and push `main` to the
      `test`.
   1. Delete `eggs` and `fried_eggs` both locally and on the remote.
  
#### Navigation
[Previous][c3_4]

[Contents][c2]

[c3_4]: <chapter_3_4.md>
[c2]: <../pro_git_supplement.md>
