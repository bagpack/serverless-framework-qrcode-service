# serverless-framework-qrcode-service

Sample for Binary Support using API Gateway REST API with Serverless Framework.

## Requirement

- x64 architecture
- [Dcoker](https://docs.docker.com/)
- [Serverless Framework](https://github.com/serverless/serverless)
- python 2.7

## Usage

First, deploy.

```
$ bash ./build_packages.sh
$ sls deploy

$ aws apigateway update-rest-api \
--rest-api-id [API-ID] \
--patch-operations op=add,path=/binaryMediaTypes/image~1png
```

Click the check (Update) icon for the Lambda function.

![check.png](https://d2mxuefqeaa7sj.cloudfront.net/s_383F8EE2E78583786CC22A9F25CD8E2ABC7246BB45E7F93DCFBBD712D8373DFC_1490669530342_file.png)

Click the OK.

![permit.png](https://d2mxuefqeaa7sj.cloudfront.net/s_383F8EE2E78583786CC22A9F25CD8E2ABC7246BB45E7F93DCFBBD712D8373DFC_1490662472570_file.png)

Finally, deploy again.

```
$ sls deploy
```

request below.

```
$ curl -X GET -H "Accept: image/png" -H "Content-Type: image/png" "https://[API-ID].execute-api.ap-northeast-1.amazonaws.com/dev/qrcode?text=Kappa"
```

Image returned.


# Reference

[krisgholson/serverless\-thumbnail: Recreate the thumbnail service described here \.\. https://aws\.amazon\.com/blogs/compute/binary\-support\-for\-api\-integrations\-with\-amazon\-api\-gateway/ \.\. using the serverless\.com framework \(and document some gotchas\)\.](https://github.com/krisgholson/serverless-thumbnail)
