# Github

## Starting with GitHub and Project Setup

    $ mkdir projects
    $ cd projects
    $ pwd

    $ git config --global user.name "XXX"
    $ git config --global user.email "X@X.email"
    $ git config --global --list

## Clone Repository
  
    $ git clone https://github.com/XXX/github-demo.git
    $ ls
    $ cd github-demo
    $ git status

## Change Project Local
  
    $ echo "Test" >> start.txt
    $ git status
    $ git add start.txt
    $ git status
    $ git commit -m "Adding  start text file"
    $ git status
    $ git push origin main

## Change Origin URL

    $ git remote set-url origin git@XXX.at:path/XXX.git
  
# Basic Git Commands
  
## Start a new Git Project

    $ pwd
    $ cd projects

    $ git init fresh-project
    $ cd fresh-project
    $ ls -al
    $ git status

    $ nano hipster.txt
    $ git status

    $ git add hipster.txt
    $ git status

    $ git commit
    $ git status

    $ cd ..
    $ rm -rf fresh-project

## Add Git to existing Project

http://www.initializr.com/

    $ pwd
    $ cd projects/web-project
    $ git init
    $ ls -al
    $ git status
    $ git add .
    $ git status
    $ git commit -m 'my first commit'
    $ git status
    $ rm -rf web-prroject

## Join an Existing Project

    Github fork project

    $ pwd
    $ cd projects
    $ git clone https://github.com/XXX/starter-web.git
    $ cd starter-web
    $ ls -al
    $ git status
    
## [Add Local Project to Gihub](#addlocalprojecttogithub)

    $ git init
    $ git add .
    $ git commit -m 'My first commit'

* Create new project on Github, without any files (no readme.md)
* Copy remote repository URL

    $ git remote add origin <REMOTE URL>
    $ git remote -v
    $ git push origin master

## Add, Commit, Push

    $ git status
    $ echo 'Das ist ein Test' >> test.txt
    $ git status

    $ git add test.txt
    $ git status

    $ git commit -m 'Add test.txt'
    $ git status

    $ git pull origin master
    $ git push origin master
    $ git status

## Tracked Files

    http://hipsum.co

    $ pwd
    $ cd projects/starter-web
    $ git status
    $ echo 'test' >> test.txt
    $ git commit -am 'Add hipster.txt'

    $ git ls-files

## Editing Files

    $ pwd
    $ cd projects/starter-web
    $ echo 'Another Test' >> newtest.txt
    $ git status
    $ git commit -m 'Adding new file'
    $ git status

    $ git add newtest.txt
    $ git status
    $ echo 'and another test' >> newtest.txt
    $ git status

    $ git add newtest.txt
    $ git commit -m 'More changes'
    $ git status

## Recursive Add

    $ pwd
    $ cd projects/starter-web
    $ git status
    $ mkdir -p level1/level2
    $ cd level1
    $ echo 'Level 1 File' >> level1.txt
    $ cd level2
    $ echo 'Level 2 File' >> level2.txt
    $ cd ../../
    $ git status

    $ git add .
    $ git status
    $ git commit -m 'Multiple Levels Recursively'

## Backing Out Changes

    $ pwd
    $ cd projects/starter-web
    $ git status
    $ cd level1
    $ echo 'Changes' >> level1.txt
    $ git status
    $ git add level1/level1.txt
    $ git status

    $ git reset HEAD level1/level1.txt
    $ git status

    $ git checkout -- level1.txt
    $ git status

## Renaming and Moving Files

    $ pwd
    $ cd projects/starter-web
    $ cd level1/level2

    $ git mv level2.txt level2-file.txt
    $ ls
    $ git status
    $ git commit -m 'rename level2 file'

    $ cd ..
    $ pwd
    $ ls
    $ mv level1.txt level1-file.txt
    $ ls
    $ git status

    $ git add -A
    $ git status
    $ git commit -m 'rename level1 file'

    $ ls
    $ git mv level1-file.txt 1-file.txt
    $ ls
    $ git status

    $ git mv 1-file.txt level1-file.txt
    $ ls
    $ git status

    $ ls
    $ mv level1-file.txt level2
    $ ls
    $ cd level2
    $ ls
    $ git status
    $ git commit -m 'Move file level1 > level2'
    $ ls
    $ cd level2

    $ mv level1-file.txt ..
    $ ls
    $ cd ..
    $ ls
    $ git status
    $ git add -A
    $ git status
    $ git commit -m 'Move leve1 file back to level1'
    $ cd ..
    $ pwd

## Deleting Files

    $ pwd
    $ projects/starter-web

    $ echo 'Temp file' >> doomed1.txt
    $ git status
    $ rm doomed1.txt

    $ echo 'Temp file' >> doomed2.txt
    $ git status
    $ git add doomed2.txt
    $ git rm doomed2.txt
    $ git commit -m 'Delete doomed2.txt'

    $ echo 'Temp file' >> doomed3.txt
    $ git status
    $ git add doomed3.txt
    $ git commit -m 'Add doomed3.txt'
    $ git rm doomed3.txt
    $ git status
    $ git reset HEAD doomed3.txt
    $ ls
    $ git status
    $ git checkout -- doomed3.txt
    $ ls
    $ git status

    $ ls
    $ rm doomed3.txt
    $ ls
    $ git status
    $ git add -A
    $ git atatus
    $ git commit -m 'delete doomed3.txt'
    $ git status

## History

    $ pwd
    $ git help log
    $ cd projects/starter-web
    $ git status
    $ git log
    $ git log --abbrev-commit
    $ git log --oneline --graph --decorate
    $ git log ae6f872..ae6234234
    $ git log --since="3 days ago"
    $ git log -- test.txt
    $ git log --follow -- level1/level1.txt
    $ git show ae6f872

## Git Alias

## Ignoring unwanted Files

    $ pwd
    $ cd projects/starter-web
    $ git status
    $ ls -al
    $ nano .gitignore
      .DS_Store
      *.log
      log/
    $ ls -al
    $ git status
    $ git add .gitignore
    $ git status
    $ git commit -m 'Add gitignore file'
    $ git status

## Cleanunp and Push to GitHub

    $ pwd
    $ cd projects/starter-web
    $ ls
    $ git status

    $ git pull origin master
    $ git push origin master

# Comparison

## Git Repository Setup
  
    $ pwd
    $ cd project/stater-web
    $ ls
    $ echo  '# Readme' >> README.md
    $ git status
    $ git add README.md
    $ git status
    $ git commit -m 'add readme'
    $ git push
    $ echo '## Introduction' >> README.md
    $ git commit -am 'new section'
    $ git push

## Compare Working Directory with Staging Area
  
    $ git status
    $ git diff

## Compare Working Directory with Repository
  
    $ git status
    $ git diff HEAD

## Compare Staging Area with Repository
  
    $ git status
    $ git diff --staged HEAD

## Limit Comparison to one File
  
    $ ls
    $ echo '## Another Section' >> README.md
    $ git status
    $ git diff -- README.md

## Comparing between Commits
  
    $ git log --oneline
    $ git diff ac6f872 HEAD
    $ git diff HEAD HEAD^
    $ git diff ac6f872 b196700

## Comparison Local and Remote
  
    $ git diff master origin/master
  
# Branching and Merging

    $ cd projects/starter-web
    $ git status
    $ git branch -a
    $ git branch mynewbranch
    $ git branch -a
    $ git checkout mynewbranch
    $ git log --oneline
    $ git branch -m mynewbranch newbranch
    $ git branch -a
    $ git checkout master
    $ git branch -d newbranch

## Happy Path, Fast Forward
  
    $ git branch -a
    $ git checkout -b title-change
    $ git status
    $ echo 'Test' >> simple.html
    $ git commit -am 'Append simple-html'
    $ git log --oneline

    $ git checkout master
    $ git diff master title-change
    $ git merge title-change
    $ git log --oneline --graph --decorate
    $ git branch -d title-change
    $ git branch

## Happy Path w.o. Fast Forward
  
    $ git checkout -b add-copyright
    $ echo 'Copyright' >> simple.html
    $ git status
    $ git commit -am 'Add copyright notice'
    $ echo 'git.training' >> README.md
    $ git commit -am 'Add copyricht README'
    $ git log --oneline --graph --decorate
    $ git checkout master
    $ git merge add-copyright --no-ff
    $ git log --oneline --graph --decorate
    $ git branch -d add-copyright
    $ git log

## Automatic Merges

    $ git status
    $ git branch
    $ git checkout -b simple-changes
    $ echo 'Test' >> humans.txt
    $ git status
    $ git commit -am 'Change humans.txt'
    $ git checkout master
    $ echo 'Test Master' >> README.md
    $ git commit -am 'Change README'
    $ git log --online --graph --decorate
    $ git branch
    $ git merge simple-changes -m 'Merging changes'
    $ git branch -d simple-changes

## Conflicting Merges
  
    $ git status
    $ git checkout -b realwork
    $ echo 'Test realwork' >> simple.html
    $ git commit -am 'Add Test realwork'
    $ git checkout master
    $ echo 'Test master' >> simple.html
    $ git commit -am 'Add Test master'
    $ git --log --oneline --decorate --all
    $ git branch
    $ git diff master realwork

    $ git merge realwork
    $ ls
    $ nano simple.html #Fix issues
    $ git commit -m 'Done fixing issues'
    $ git status
    $ nano .gitignore # *.orig
    $ git status
    $ git add .gitignore
    $ git commit -m 'Fix issues'
    $ git branch
    $ git branch -d realwork

# Rebasing

![Rebasing](https://git-scm.com/book/en/v2/images/basic-rebase-2.png)

    $ pwd
    $ cd projects/starter-web
    $ ls
    $ git status
    $ git checkout -b myfeature
    $ echo 'Test' >> humans.txt
    $ git status
    $ git commit -am 'Change humans.txt'
    $ git checkout master
    $ echo 'Test master' >> README.md
    $ git status
    $ git commit -am 'Change README'
    $ git log --oneline --decorate --all --graph

    $ git checkout myfeature
    $ git rebase master
    $ git log --online --decorate --all -graph
    $ git status

    $ git checkout master
    $ git branch
    $ git diff master myfeature
    $ git merge myfeature
    $ git branch -d myfeature

## Pull with Rebase

    $ pwd
    $ cd projects/starter-web
    $ git pull origin master
    $ git push origin master
    $ git status

    $ echo 'Test' >> simple.html
    $ git commit -am 'Change simple'
    $ git status

## Meanwhile changes in Github

git fetch is the command that tells your local git to retrieve the latest meta-data info from the original (yet doesn’t do any file transferring. It’s more like just checking to see if there are any changes available).
git pull on the other hand does that AND brings (copy) those changes from the remote repository.

Aus <https://www.freecodecamp.org/news/git-fetch-vs-pull/> 

    $ git status
    $ git fetch origin master
    $ git status
    $ git pull --rebase origin master
    $ git status
    $ git log --online --graph --all --decorate
  
# Stashing

    $ pwd
    $ cd projects/starter-web
    $ git status
    $ echo 'Test' >> simple.html
    $ git status

    $ git stash
    $ git status
    $ echo 'Test' >> README.md
    $ git commit -am 'Change README'
    $ git status

    $ git stash apply
    $ git status
    $ git commit -am 'Change simple.html'
    $ git status

    $ git stash list
    $ git stash drop
  
 # Source
 
 https://www.udemy.com/share/101tLw3@XJy5hFsYONQ-Q7SLQtvG4GaAkCdcT9Z1Pxf18YUVNXsXXVOtoIYHfeNOea7dWcIv/
