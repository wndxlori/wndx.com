Jenkins/Git

This bit me twice in the last couple weeks, so hopefully this post will save someone else the trouble in the future.

Let's say you change your Git server at some point.  It's the same repo, but you are now getting from a different server.  If you just change your Jenkin's build configuration to point to the new server, you are setting yourself up for pain in the future.

What you really need to do is wipe out your workspace, TOO.  You see, at some point in the future, your build steps may get updated to say... add a Git tag.  This will silently fail, because it's going to run those commands in your workspace, WHICH STILL THINKS IT'S GIT SERVER IS THE OLD ONE.

Really annoying problem to track down. (Yes, I am certain the Git tagging is working, why?)

