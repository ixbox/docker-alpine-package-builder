#!/bin/sh
REPOSITORY=${REPOSITORY:-https://github.com/alpinelinux/aports.git}
PACKAGES=${PACKAGES:-main/nginx}
S3BUCKET=${S3BUCKET:-""}
S3PATH=${S3PATH:-/}
S3URL=s3://$S3BUCKET$S3PATH
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-ap-northeast-1}

apk update

[ ! -d /home/build/aport ] && sudo -u build bash -c "git clone $REPOSITORY /home/build/aport"

for PACKAGE in $PACKAGES ; do
    sudo -u build bash -c "cd /home/build/aport/$PACKAGE; abuild -r"
done

[ "x$S3BUCKET" != "x" ] && aws s3 sync /home/build/packages/ $S3URL || true
