resource "aws_s3_bucket" "bhh" {
  bucket = "${var.Bucket_Name}"

  tags = {
    Environment = "${var.Environment}"
    Time        = "${timestamp()}"
  }
}
~
