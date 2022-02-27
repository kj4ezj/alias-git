# alias-git
This library contains BASH aliases and functions for common or overly-verbose `git` commands to speed up developer workflow.

### Index
1. [Aliases](README.md#aliases)
   1. [apply](README.md#apply)
   1. [pull](README.md#pull)
   1. [push](README.md#push)
   1. [staged](README.md#staged)
   1. [status](README.md#status)
1. [Usage](README.md#usage)

## Aliases
This library contains several aliases and functions.

### apply
The `apply` alias is equivalent to `git cherry-pick` and can accept flags and arguments following this string. For example, you can use this alias to cherry-pick a single commit...
```bash
apply a94eae0d2a5cafeff630c77815d6073379ffde56
```
...or a range of commits.
```bash
apply 0de6d99...a94eae0
```
You can also use this alias when addressing conflicts during a rebase.
```bash
apply --continue
```
Any flags or arguments you use with `git cherry-pick` should work with this alias.

### pull
The `pull` operation is a function that performs `git pull` while providing an origin, to suppress the annoying messages `git` gives you for new branches where an origin might not be specified locally. The origin branch is assumed to have the same name as the local branch. After the pull, it updates all submodules (if there are any).

### push
The `push` operation is a function that performs `git push` while providing an origin, to suppress the annoying messages `git` gives you for new branches where an origin might not be specified locally. The origin branch is assumed to have the same name as the local branch.

If the current branch is named `develop`, `main`, or `master`, the function will refuse to push unless the branch name is given as the first argument.
```bash
push main
```
This protects repository administrators from accidentally pushing commits to base branches.

Force-pushes are supported on feature branches. To force push, provide the `-f` or `--force` flag as argument one.
```bash
push --force
```
This will, of course, overwrite the remote branch with the contents of your local branch without regard for any differences in the commit history.

Force-pushing to a base branch is intentionally not supported. If you wish to force-push to a base branch, you will have to type out the `git` command in full.

### staged
The `staged` alias is equivalent to `git diff --staged`, and accepts any arguments or flags you might use with `git diff`.

### status
The `status` alias is equivalent to `git status`, and accepts any arguments or flags you might use with `git status`.

## Usage
Make a folder for these types of scripts and aliases to exist, if you don't have one already.
```bash
mkdir -p ~/.bash
cd ~/.bash
```
Follow the instructions at the top-right of this repo to use your preferred method to clone this repo into that folder.
```bash
git clone --recursive git@github.com:kj4ezj/alias-git.git
```
Then, source `git.sh` in your `~/bashrc`, `~/bash_aliases`, `~/bash_profile`, or similar.
```bash
source ~/.bash/alias-git/git.sh
```
Finally, restart your shell to use these aliases.
