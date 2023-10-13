# tetf


# submodules/subworkflows

For this project,`snakemake` subworkflows are housed in separate repos and included as `git` submodules. 
More information about working with submodules is available [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

When developing, run following command from the base directory of this repo to pull the latest commit from the main branch of a given submodule:

```
git submodule update --remote <submodule name>
```

When developing, run the following command from the base directory of this repo to add a submodule for the first time:

```
git submodule add git@github.com:mal2017/<repo name>.git subworkflows/<repo name>

git commit -am 'Added subworkflow <repo name> as submodule'
```

When cloning this repo, use the following:

```
git clone --recurse-submodules <this repo>
```

When working on code in submodules, go to the submodule and git add/commit changes as usual.

Then push, but if on a detached head you may get a warning message. Then you can push it to its remote by

```bash
git push origin HEAD:main
```

Then return to main directory and git add the subdirectory containing the submodule.

Commit and push as normal.