#!/bin/bash

set -ex

ADD_RUNNER_TOKEN=$(curl -L -s \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: token ${GITHUB_PAT}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/${OWNER}/${REPO}/actions/runners/registration-token | jq .token --raw-output)

./config.sh --url https://github.com/${OWNER}/${REPO} --token $ADD_RUNNER_TOKEN --unattended

cleanup() {
    REMOVE_RUNNER_TOKEN=$(curl -L -s \
        -X POST \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: token ${GITHUB_PAT}" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/repos/${OWNER}/${REPO}/actions/runners/remove-token | jq .token --raw-output)

    ./config.sh remove --token $REMOVE_RUNNER_TOKEN
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!