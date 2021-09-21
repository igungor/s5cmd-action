# s5cmd action

This Github action uses [s5cmd](github.com/peak/s5cmd) to interact with AWS S3
or any S3-compatible service, such as GCS.

## Usage

```yaml
name: Upload docs to S3 with s5cmd

on:
  push:
    branches:
    - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: igungor/s5cmd-action@master
      with:
        args: cp -n -s -u ./docs s3://${{ secrets.AWS_BUCKET }}/docs/
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_REGION: ${{ secrets.AWS_REGION }}  # optional. default: 'us-east-1'
```
