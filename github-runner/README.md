# Github Runner

## Introduction

Based on code from [this article](https://testdriven.io/blog/github-actions-docker/) but for Repository specific runners and with an attempt at multi arch and token removal

## Running the contaner

```
docker build . -t actions-runner
docker run -d --name actions-runner -e GITHUB_PAT -e OWNER -e REPO actions-runner
```

The expected env vars are mostly self-explanatory. The GITHUB_PAT var is a fine-grained PAT from Github with admin r/w access to the repo
