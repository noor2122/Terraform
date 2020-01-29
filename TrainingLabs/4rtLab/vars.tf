variable "AWS_REGION" {
  default = "us-east-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-059d836af932792c3"
    us-west-2 = "ami-02e7fad8336aa2c57"
    eu-west-1 = "ami-029f9476"
  }
}
