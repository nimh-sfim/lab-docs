### Basic Branching and Merging

#### Questions for Understanding
1. Can you switch branches with modified but uncommitted changes?
1. Does your working area change when you change branches?
1. What is a "fast-forward"?
1. How do you delete a branch?
1. In the example given in "Basic Merging," why is the merge not a
   "fast-forward"?
1. Do merge commits have one parent?
1. If there is a merge conflict, is a merge commit made?
1. What command can you use to find out which files have merge conflicts?
1. How can you tell which branch one side of the merge conflict came from?
1. Will `git status` indicate if you've finished merging conflicts?

#### Exercises
Do exercises in order in the recipes repository.
1. Create and checkout to a new branch, `muffins`.
   Create a recipe for muffins on the branch, and then merge it into main.
   What kind of merge was this?
1. Create and checkout to a new branch, `cake2`.
   Make a cake recipe that is identical to the one in the branch `cake`,
   but change the ingredients or baking instructions slightly.
   Merge `cake` into `main`, and then merge `cake2` into main.
   You will need to resolve the merge conflict.
1. Delete all branches except for `main`.

#### Navigation
[Previous][c3_1]

[Next][c3_3]

[Contents][c2]

[c3_1]: <chapter_3_1.md>
[c3_3]: <chapter_3_3.md>
[c2]: <../pro_git_supplement.md>
