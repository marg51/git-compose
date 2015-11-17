# git-compose

Update your local repos to be up-to-date with github

## How to use

Create a new file `git-compose` at the root of your projects:

```
angular/angularjs:master:Frontend
python/cpython:82653bf:cpython:./build
```

and run `/path/to/git-compose.sh git-compose`

It will fork `master`'s branch from `github.com/angular/angularjs` and fork `82653bf` from `github.com/python/cpython` to, respectively, Frontend and cpython.

At the end, it will run `./build` from cpython.

If the local repo already exists, it will fetch new data and update to the specified ref
