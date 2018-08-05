# social-media-deployment
Scripts and data used to deploy the social media site on a remote Ubuntu instance

## Deployment
1) Launch an Ubuntu instance with ports 22, 80 and 9000 open
2) clone this repository
3) execute the following:<br>`$ bash deploy.sh -i {path_to_pem} -h {public_dns_path}`<br> where `{path_to_pem}` represents the path to the pem file and `{public_dns_path}` is the public dns path of the machine.