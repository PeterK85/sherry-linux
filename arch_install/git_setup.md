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
[Users]
	name=First Last
	email=myemail@email.com
```

Then create another file called credentials.
```
touch ~/.config/git/credentials
```

Inside of it put the following:
```
https://user:pass@github.com
```
