variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "ap-southeast-1"
}

variable "SECURITY_GROUP" {
    type = list
    default = ["sg-24076", "sg-90890"]

}

variable "AMIS" {
    type = map
    default = {
        ap-southeast-1 = "ami-0f74c08b8b5effa56"
        us-east-1 = "ami-04b3c39a8a1c62b76"
        ap-northeast-1 = "ami-0822295a729d2a28e"
    }

}