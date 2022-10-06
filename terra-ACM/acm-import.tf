resource "aws_acm_certificate" "tch-cert" {
  private_key = "${file("private.key")}"
  certificate_body = "${file("actual_cert.cer")}"
  certificate_chain = "${file("inter.cer")}"
  }  