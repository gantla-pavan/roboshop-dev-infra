  resource "aws_instance" "mongodb" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.mongodb_sg_id]
    subnet_id = local.database_subnet_id
    # iam_instance_profile = aws_iam_instance_profile.bastion.name
    # need more for terraform
    # root_block_device {
    #     volume_size = 50
    #     volume_type = "gp3" # or "gp2", depending on your preference
    # }

    # user_data = file("bastion.sh")
    
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-mongodb"   #roboshop dev-mongodb
        }
    )

    

    }

    resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id
    
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }

   provisioner "file" {
        source  =   "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
   }    

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        # "sudo sh /tmp/bootstrap.sh"
        "sudo sh /tmp/bootstrap.sh mongodb"
    ]
  }
 
}


# resource "aws_iam_instance_profile" "bastion" {
#   name = "bastion"
#   role = "BastionTerraformAdmin"
# }

  resource "aws_instance" "redis" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.redis_sg_id]
    subnet_id = local.database_subnet_id
    # iam_instance_profile = aws_iam_instance_profile.bastion.name
    # need more for terraform
    # root_block_device {
    #     volume_size = 50
    #     volume_type = "gp3" # or "gp2", depending on your preference
    # }

    # user_data = file("bastion.sh")
    
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-redis"   #roboshop dev-redis
        }
    )

    

    }

    resource "terraform_data" "redis" {
  triggers_replace = [
    aws_instance.redis.id
    
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.redis.private_ip
  }

   provisioner "file" {
        source  =   "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
   }    

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        # "sudo sh /tmp/bootstrap.sh"
        "sudo sh /tmp/bootstrap.sh redis"
    ]
  }
 
}



resource "aws_instance" "rabbitmq" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.rabbitmq_sg_id]
    subnet_id = local.database_subnet_id
    # iam_instance_profile = aws_iam_instance_profile.bastion.name
    # need more for terraform
    # root_block_device {
    #     volume_size = 50
    #     volume_type = "gp3" # or "gp2", depending on your preference
    # }

    # user_data = file("bastion.sh")
    
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-rabbitmq"   #roboshop dev-rabbitmq
        }
    )

    

    }

    resource "terraform_data" "rabbitmq" {
  triggers_replace = [
    aws_instance.rabbitmq.id
    
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.rabbitmq.private_ip
  }

   provisioner "file" {
        source  =   "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
   }    

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        # "sudo sh /tmp/bootstrap.sh"
        "sudo sh /tmp/bootstrap.sh rabbitmq"
    ]
  }
 
}


# resource "aws_iam_instance_profile" "bastion" {
#   name = "bastion"
#   role = "BastionTerraformAdmin"
# }
