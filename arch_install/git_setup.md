# Git Setup On New Machine

## Install Git

Install git... `sudo pacman -S git`.

## Create .config Dir

Create a new directory for git information in .config dir in home dir.

```
mkdir ~/.config/git
```

## Add User

And then make a file called config.
```
touch ~/.config/git/config
```

Inside of it put the following:
```
[user]
	email=myemail@email.com
	name=First Last
```

Then create another file called credentials.
```
touch ~/.config/git/credentials
```

Inside of it put the following:
```
https://user:pass@github.com
```

(I don't know if the following has to be done in a directory that is a git repo, but I happened to do it in one the first time I did this.)

Then enter in this command:
```
git config credential.helper store
```
