data "terraform_remote_state" "main" {
  backend = "s3"

  config {
    bucket = "tf-remote-state-training-nov"
    key = "jenkins_with_slave_CI_CD/terraform.tfstate"
    region = "us-east-1"
  }
}
resource "null_resource" "deploy_stacks" {
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("${var.my_private_key_path}")}"
    host = "${data.terraform_remote_state.main.ci_server_public_ip}"

  }
  provisioner "local-exec" {
    command = "tar -czvf stacks.tgz -C ../../../ stacks "      
  }
  provisioner "file" {
    source = "stacks.tgz"
    destination = "/tmp/stacks.tgz"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo service docker restart",
      "docker swarm init",
      "tar -xzvf /tmp/stacks.tgz -C /tmp ",
      "docker network create -d overlay sonarqube",
      "echo ${var.jenkins_user} | docker secret create jenkins-user -",
      "echo ${var.jenkins_pass} | docker secret create jenkins-pass -",
      "docker stack deploy -c /tmp/stacks/jenkins.yml jenkins",
      "docker stack deploy -c /tmp/stacks/nexus.yml nexus",
      "docker stack deploy -c /tmp/stacks/sonarqube.yml sonarqube",
    ]
  }

  provisioner "local-exec" {
    command = "rm stacks.tgz"      
  }
}