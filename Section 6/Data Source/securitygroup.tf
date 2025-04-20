data "aws_ip_ranges" "ap_southeast_ip_range" {
    regions = ["ap-southeast-1", "ap-southeast-2"]
    services=["ec2"]
}

resource "aws_security_group" "sg_custom_ap_south" {
    name = "sg_custom_ap_south"

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = data.aws_ip_ranges.ap_southeast_ip_range.cidr_blocks
    }

    tags = {
        CreateDate = data.aws_ip_ranges.ap_southeast_ip_range.create_data
        SyncToken = data.aws_ip_ranges.ap_southeast_ip_range.sync_token
    }
}