# resource "aws_service_discovery_private_dns_namespace" "privdns" {
#     name = "jdjc.com"
#     vpc = aws_vpc.vpc.id
# }


resource "aws_route53_zone" "privdns" {
  name          = "jdjc.com"
  force_destroy = true
  vpc {
    vpc_id = aws_vpc.vpc.id
  }
}

resource "aws_route53_record" "db" {
  zone_id = aws_route53_zone.privdns.id
  name    = "jdjcdb.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_db_instance.db.address]
}