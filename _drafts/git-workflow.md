Feature Development

Source: <http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html>

Our git feature development workflow consists of these steps:

1. Pull to update your local master
1. Check out a feature branch
1. Do work in your feature branch, committing early and often
1. Rebase frequently to incorporate upstream changes
1. (Optional)Interactive rebase (squash) your commits
1. Merge your changes with master
1. Issue Pull Request
1. Pull Request is reviewed, any changes necessary are completed, and then merged to master

First, and while in your master branch (git checkout master), pull in the most recent changes:

	`git pull origin master`
	
This should never create a merge commit because we are never working directly in master.
NB: Whenever you perform a pull, merge or rebase, make sure that you run tests directly afterwards. Git may not show any conflicts but that doesn’t mean that two changes are compatible. Also run tests before you commit (of course).
	
Begin by checking out a feature branch, related to your Pivotal Tracker story, using the story number and a descriptive title

	`git checkout -b 3275-git-workflow`
	
The id allows us to easily track this branch back to the story that spawned it. The title is there to give us humans a little hint as to what’s in it. Do some work on this branch, committing early and often (for instance, whenever your tests pass). Rebase against the upstream frequently to prevent your branch from diverging significantly:

```
git fetch origin master
git rebase origin/master
```

NB: This is often done by checking master out and pulling, but this method requires extra steps:

```
git checkout master
git pull
git checkout 3275-git-workflow
git rebase master
```

If it becomes impossible to rebase (conflicts, etc), then you'll have to merge instead.  In order to maintain the branch topology (so the branch commits can be seen separately) you'll need to merge with no-fast-forward:

	`git merge --no-ff master` 

Once this feature branch is ready to be merged back into master, you will need to push to the remote branch.

```
git checkout 3275-git-workflow
git push
```
Note that there is no down-side to pushing to a remote branch (other than a bit of branch maintenance when you are done).  In fact, it's a good practice for any branch that lives longer than a day to be pushed remotely to ensure that no code gets lost.  Also, you can get comments from other developers on problems this way, because then they can checkout your branch and see for themselves.

Now that your feature branch is visible on Github, you can issue the pull request. 
Browse to the branch with your recent work on Githib, and hit the "Pull Request" button.  Write up any description or details that you think might be useful for a reviewer.  It's also good practice to take a look at the File diffs, just to make certain there is nothing unexpected showing up.  Then hit "Send".

When you send a pull request, you're starting a discussion.  The other developers should get an email (or a Campfire notification) of the pull request.  Please review pull requests promptly, if it does not interfere with your workflow.

Some back and forth is often required before a pull request is accepted. The reviewer needs clarification, or the change doesn't conform to the project's coding conventions, or maybe someone was able to take a concept 80% to completion and needs help working through the last bits.  The discussion view on a pull request is quite valuable, as is the ability to see comments on *exactly* the lines needing clarification.

Once a pull request is reviewed, the reviewer hits the "Merge" button, and voila! we have a feature merged into the master branch for continuous delivery.