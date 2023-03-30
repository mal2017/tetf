# tetf


# submodules/subworkflows

For this project,`snakemake` subworkflows are housed in separate repos and included as `git` submodules. 
More information about working with submodules is available [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

When developing, run following command from the base directory of this repo to pull the latest commit from the main branch of a given submodule:

```
git submodule update --remote <submodule name>
```

When cloning this repo, use the following:

```
git clone --recurse-submodules <this repo>
```

