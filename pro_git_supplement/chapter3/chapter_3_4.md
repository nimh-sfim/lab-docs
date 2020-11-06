### Branching Workflows

#### Questions for Understanding
1. Rank the stability of `master` (note: in most new workflows, `main`),
   `develop`, and `topic` in Figure 27.
1. In Figure 29, why are commits C2 and C4 included in `master`, when they
   were created in the now-deleted branch `iss91`?

#### Exercises
Do exercises in order in the recipes repository.
1. Similar to Figure 29, do the following:
   1. Create a new branch, `toast`, with a commit holding just the
      ingredients for a toast recipe.
   1. Branch off of `toast` to create a branch `toast_v2` that has a recipe
      for toast that you think is fancy.
      (Consider "French Toast" or "Cinnamon Toast.")
   1. Return to the original toast and complete a recipe for plain toast on
      that branch.
   1. You want the fancy stuff!
      Delete the original `toast` branch and merge in `toast_v2`.
      View the history and make sure you understand why it looks the way it
      does.
  
#### Navigation
[Previous][c3_3]

[Next][c3_5]

[Contents][c2]

[c3_3]: <chapter_3_3.md>
[c3_5]: <chapter_3_5.md>
[c2]: <../pro_git_supplement.md>
