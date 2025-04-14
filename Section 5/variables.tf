variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "ap-southeast-1"
}

variable "SECURITY_GROUP" {
    type = list
    default = ["sg-24076", "sg-90890"]

}