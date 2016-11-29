#Rails Deployment

Way, way back, you didn't have many options for Rails deployment.  It was all roll your own with your own hardware, and if you were lucky, you used SwitchTower (or Capistrano, as it is now known).

Then we started to get options.  Now, there's such a dizzying array of options, it's hard to figure out which one is right for you.  Let's list some of the available Rails deployment options, and review their strengths and weaknesses, so that you can make an informed decision about which one might be right for your application.

##aaS Buffet

Rails deployment can come in two different flavours.  Infrastructure As A Service (IaaS), Platform As A Service (PaaS).

![Cloud Service Options](http://www.csinaction.com/img/posts/defining-the-cloud/flexibility-vs-specialization.png)

from [csinaction.com](http://www.csinaction.com/2014/07/26/defining-the-cloud/)

Software As A Service (SaaS) solves a whole other class of problems for your application development needs, and I won't be addressing those here.

###IaaS

IaaS is simple, and flexible.  You get access to low-level resources, and pretty much manage all of it yourself.  But with that flexibility comes a cost -- complexity.  It is SO NOT simple to manage and organize all those resources yourself.

Examples of IaaS are Amazon Web Services (AWS), Digital Ocean and Rackspace.

###PaaS

PaaS attempts to tame the complexity of IaaS by specializing in a limited number of supported deployment environments.  Because your options are limited, this is much simpler.  But you are limited to the supported options, so if those constraints do not suit, you'll need to look elsewhere.

Google App Engine, Heroku, and AWS OpsWorks are examples.


[Right Scale](http://rightscale.com) is one of those "in the middle" solutions, which attempts to tame the complex

[Engine Yard](http://engineyard.com) is a similar solution, attempting to "tame" the complexities of cloud deployment, by offering services (DEIS) supporting familiar tools (like Docker).

#Deploy via

Capistrano
Heroku


Chef
Pupper
Vagrant
Docker

Ansible
Mina
Vlad the Deployer
git-deploy
Moonshine
