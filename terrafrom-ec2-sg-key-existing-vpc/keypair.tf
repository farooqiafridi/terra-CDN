resource "aws_key_pair" "test_key" {
  key_name      = "test_key"
  public_key    = file(var.public_key_path)
}
