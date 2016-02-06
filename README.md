# Supported tags and respective ```Dockerfile``` links

- latest [(Dockerfile)](https://github.com/ixbox/docker-alpine-package-builder/blob/master/Dockerfile)

## **Images**

https://hub.docker.com/r/ixbox/alpine-package-builder/

## **Usage**
To build nginx package, run with following commands
```shell
docker run --rm -v $(pwd)/packages:/home/build/packages ixbox/alpine-package-builder
```

### options

| env | description | default value |
|:----|:------------|:--------------|
| REPOSITORY | repository url | https://github.com/alpinelinux/aports.git |
| PACKAGES | build packages (space separated) | main/nginx main/nginx-lua |
| S3BUCKET | s3 bucket name | - |
| S3PATH | upload path | / |
| AWS_ACCESS_KEY_ID | access key | - |
| AWS_SECRET_ACCESS_KEY | secret key | - |
| AWS_DEFAULT_REGION | region | ap-northeast-1 |

ex)
```
docker run --rm \
           -e REPOSITORY="https://github.com/ixbox/alpine-nginx.git" \
           -e PACKAGES="main/nginx" \
           -e S3BUCKET="pub.ixbox.jp" \
           -e S3PATH="/alpine/v3.3/" \
           -e AWS_ACCESS_KEY_ID="AKIAIOSFODNN1EXAMPLE" \
           -e AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K1MDENG/bPxRfiCYEXAMPLEKEY" \
           ixbox/alpine-package-builder
```
