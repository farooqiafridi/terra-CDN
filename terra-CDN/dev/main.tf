provider "aws" {
  region = "us-east-1"
}


module "cloudfront" {
  source = "../modules/cloudfront"
  bucket-name        = "${var.BUCKET_NAME}"
  tag_key_Name       =  "${var.ENVIRONMENT}"
  comment            = var.comment
  logs_prefix        = "logs"
  Environment        = "${var.ENVIRONMENT}"
  price_class        = "PriceClass_All"

}

output "bucket-name" {
  value = module.cloudfront.bucknet-name
}

 logstash --name logstash --network=efk_default --link elasticsearch:elasticsearch -itd^C-v 
 "$PWD":/config-dir  docker.elastic.co/logstash/logstash:8.4.2 -f /config-dir/logstash.conf