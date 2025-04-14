variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "ap-southeast-1"
}

variable "SECURITY_GROUP"{
    type=list
    default = ["sg-24076", "sg-90890"]
}

variable "AMIS" {
    type = map
    default = {
        ap-southeast-1 = "ami-01938df366ac2d954"
        us-east-1 = "ami-04b3c39a8a1c62b76"
        ap-northeast-1 = "ami-0822295a729d2a28e"
    }

}

variable "PATH_TO_PRIVATE_KEY" {
    default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}