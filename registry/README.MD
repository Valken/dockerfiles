# Docker registry backed by S3

## Background

Based on docs found [here](https://docs.docker.com/registry/deploying/) and using the S3 storage driver documented [here](https://github.com/docker/docker.github.io/blob/master/registry/storage-drivers/s3.md)

## Setup

Create an S3 bucket, IAM user and permissions required to access the bucket

```bash
aws cloudformation create-stack \
    --stack-name docker-registry-s3-backend \
    --template-body file://docker-registry-s3-storage.yml \
    --capabilities CAPABILITY_IAM
```

Get the S3 bucket name

```bash
aws cloudformation describe-stacks --stack-name docker-registry-s3-backend | jq ".Stacks[0].Outputs[] | select(.OutputKey==\"BucketName\").OutputValue"
```

Create credentials for the IAM user

```bash
aws iam create-access-key \
    --user-name $(aws cloudformation describe-stacks --stack-name docker-registry-s3-backend | jq ".Stacks[0].Outputs[] | select(.OutputKey==\"UserName\").OutputValue" -r)
```