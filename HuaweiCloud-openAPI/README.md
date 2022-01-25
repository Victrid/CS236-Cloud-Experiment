# Use Huawei OpenAPI to create VM

You need to fill in these  values in `credentials.py`:

Retrieve these from API page:

-   hw_ak: Access key
-   hw_sk: secret key

Retrieve these from “购买弹性云服务器-生成OpenAPI最佳实践”

-   hw_vpc_default: VPC ID
-   hw_subnet_id: subnet ID
-   hw_sys_FullAccess: security group
-   image: Image ID
-   op_svc_userid: Service User ID

Finally, Run with `./do.py`.

## WARN

In production, the private keys in config.sh should be modified, otherwise one can log-in with exposed keys here.
