resource "aws_route53_zone" "example-com" {
    name = "supplychain.com"
}

resource "aws_route53_record" "server1-record" {
    zone_id = "${aws_route53_zone.example-com.zone_id}"
    name = "helloworld.com"
    type = "A"
    ttl = "300"
    records = ""
}