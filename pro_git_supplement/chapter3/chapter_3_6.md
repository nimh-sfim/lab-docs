### Rebasing

#### Questions for Understanding
1. Why does rebasing appear to make the history cleaner?
1. What will attract the scorn of friends and family?
1. What are two cases in which rebasing is fine?
1. Discuss the pros and cons of rebasing vs. merging.

#### Exercises
Do exercises in order in the recipes repository.
1. Clean rebase
   1. Make two branches, one called `bread` and one called `sandwich`.
   1. Create the `sandwich` recipe while referencing the incomplete `bread`
      recipe.
   1. Switch to the `bread` recipe and complete it.
   1. Rebase `bread` onto `main` and merge it.
   1. Rebase `sandwich` onto `main` and merge it.
   1. View the history.
      Note how it implies that `bread` came first in history, even though
      you actually made the sandwich recipes first.
1. Scorn-inducing rebase
   1. Create a branch, `broccoli`, with instructions on making broccoli.
      Make sure the branch has several commits.
   1. Push `broccoli` to `test` (as set up in the previous chapter).
   1. Locally, rebase `broccoli` onto `main`.
   1. Add an additional recipe on your `broccoli` branch.
   1. Attempt to push to the `test` remote with your `broccoli` branch.
   1. Force-push the new `broccoli` branch to the remote.
   1. What would happen if somebody had already based new work after your
      first push?
      In this scenario, is it likely that something like that has happened?
      What if the project was larger?
  
#### Navigation
[Previous][c3_5]

[Contents][c2]

[c3_5]: <chapter_3_5.md>
[c2]: <../pro_git_supplement.md>
