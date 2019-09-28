# RailsBridge Website

[![Build Status](https://travis-ci.org/railsbridge/railsbridge_dot_org.svg?branch=master)](http://travis-ci.org/railsbridge/railsbridge_dot_org)

This is the source code for the RailsBridge website at http://railsbridge.org.

# Contributing

Your contributions are encouraged. Here's how you can make changes to the site.

Fork the repository to your own GitHub account.

Download the project:

```
  $ git clone git@github.com:MyGitHubAccount/railsbridge_dot_org.git
  $ cd railsbridge_dot_org
```

If you use RVM, make a gemset:

```
  $ rvm use ruby-2.5.6@railsbridge_dot_org --create
```

Install gems:

```
  $ bundle install
```

Run the application:

```
  $ rails server
```

Make your changes.

Commit and push to the remote repository:

```
  $ git commit -am "some helpful comment"
  $ git push origin master
```

Make a pull request.
