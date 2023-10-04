data "aws_route53_zone" "kpa23_public_zone" {
  name         = "kainos-platform-academy.com"
  private_zone = false
}

resource "aws_acm_certificate" "lb-cert" {
  domain_name       = "${aws_lb.lb.name}.${data.aws_route53_zone.kpa23_public_zone.name}"
  validation_method = "DNS"

  tags = {
    Name = "jc-lb-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert-ssl-record" {
  for_each = {
    for dvo in aws_acm_certificate.lb-cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type

    }
  }
  allow_overwrite = true
  ttl             = 60
  zone_id         = data.aws_route53_zone.kpa23_public_zone.zone_id
  name            = each.value.name
  records         = [each.value.record]
  type            = each.value.type
}

resource "aws_acm_certificate_validation" "cert-validation" {
  certificate_arn         = aws_acm_certificate.lb-cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert-ssl-record : record.fqdn]
}

resource "aws_route53_record" "lb-dns-record" {
  zone_id = data.aws_route53_zone.kpa23_public_zone.zone_id
  name    = "www.jacksdnszone-tyrone-is-the-best.com"
  type    = "A"

  alias {
    name                   = "dualstack.${aws_lb.lb.dns_name}"
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}