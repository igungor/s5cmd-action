#!/bin/sh

set -e

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo "AWS_ACCESS_KEY_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "AWS_SECRET_ACCESS_KEY is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_REGION" ]; then
  AWS_REGION="us-east-1"
fi

mkdir /root/.aws/
cat << EOF > /root/.aws/credentials
[s5cmd-action]
aws_access_key_id     = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
aws_session_token = ${AWS_SESSION_TOKEN}
region = ${AWS_REGION}
EOF

sh -c "cat /root/.aws/credentials && AWS_PROFILE=s5cmd-action /s5cmd $*"

rm -f /root/.aws/credentials
