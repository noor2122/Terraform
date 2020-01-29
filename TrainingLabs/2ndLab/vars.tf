variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  
}
variable "AMIs" {
  type = map(string)
  default = {

    us-east-2 = "ami-0d542ef84ec55d71c"
    us-west-1 = "ami-04bc3da8f14823e88"
    us-west-2 = "ami-01460aa81365561fe"
  }

}
