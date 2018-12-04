module "vpc-docker" {
  source = "../../modules/vpc-docker"
  tags = "${data.terraform_remote_state.global.tags}"
}
resource "aws_key_pair" "deployer" {
  key_name = "jenkins-key"
  public_key = "${file(var.my_public_key_path)}"
}

module "ec2-docker" {
  source             = "../../modules/ec2-docker"
  instance_type      = "t2.medium"
  security_group_ids = "${module.vpc-docker.sg_ci_server_id}"
  key_name           = "${aws_key_pair.deployer.key_name}"
  key_path           = "${var.my_private_key_path}"
  docker_volume_size = "60"
  tags = "${data.terraform_remote_state.global.tags}"
}

//resource "aws_eip" "eip" {
//  instance = "${module.ec2-docker.ci_server_id}"
//  vpc = true
//}


output "ci_server_public_ip" {
  value = "${module.ec2-docker.ci_server_public_ip}"
}

output "ci_server_id" {
  value = "${module.ec2-docker.ci_server_id}"
}
