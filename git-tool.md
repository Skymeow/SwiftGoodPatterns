#### Go to this : [https://github.com/Product-College-Courses/Core-Git-Branching](https://www.gitbook.com/book/skymeow/swift-good-patterns1/edit#)!

#### reset dev branch

```
git reset --hard origin/dev
```

#### continue rebase:

git rebase --continue

#### abort rebase

git rebase --abort

#### putting my branch on top of dev branch

\(if you are on your branch\)

##### git rebase dev

#### if you want to merge your branch into dev,

##### go to dev branch and do git merge your branch

### push untracked files:

`git ls-files -o --exclude-standard`gives untracked files, so you can do something like below \( or add an alias to it\):

```

```

### go back to the state before stash:

```
git stash list
git apply ${}
```



