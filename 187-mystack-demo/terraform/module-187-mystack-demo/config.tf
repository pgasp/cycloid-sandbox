"locals" = {
  "tags_cycloid" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }

  "tags_stack" = {}
}

"provider" "aws" {
  "region" = "eu-west-3"
}

"resource" "aws_db_instance" "myinstancedb" {
  "instance_class" = "demo"

  "tags" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }

  "vpc_security_group_ids" = ["${aws_security_group.generated_sg_aws_db_instance_myinstancedb.id}"]
}

"resource" "aws_instance" "myinstance" {
  "tags" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }

  "vpc_security_group_ids" = ["${aws_security_group.generated_sg_aws_instance_myinstance.id}"]
}

"resource" "aws_security_group" "generated_sg_aws_db_instance_myinstancedb" {
  "name_prefix" = "generated_sg_aws_db_instance_myinstancedb"

  "tags" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }
}

"resource" "aws_security_group" "generated_sg_aws_instance_myinstance" {
  "name_prefix" = "generated_sg_aws_instance_myinstance"

  "tags" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }
}

"resource" "aws_security_group_rule" "rule_egress_generated_sg_aws_instance_myinstance_to_generated_sg_aws_db_instance_myinstancedb_3306_3306" {
  "description" = "sql"

  "from_port" = "3306"

  "protocol" = "TCP"

  "security_group_id" = "${aws_security_group.generated_sg_aws_instance_myinstance.id}"

  "source_security_group_id" = "${aws_security_group.generated_sg_aws_db_instance_myinstancedb.id}"

  "to_port" = "3306"

  "type" = "egress"
}

"resource" "aws_security_group_rule" "rule_ingress_generated_sg_aws_instance_myinstance_to_generated_sg_aws_db_instance_myinstancedb_3306_3306" {
  "description" = "sql"

  "from_port" = "3306"

  "protocol" = "TCP"

  "security_group_id" = "${aws_security_group.generated_sg_aws_db_instance_myinstancedb.id}"

  "source_security_group_id" = "${aws_security_group.generated_sg_aws_instance_myinstance.id}"

  "to_port" = "3306"

  "type" = "ingress"
}

"variable" "env" {
  "default" = "[PLACEHOLDER]"

  "type" = "string"
}

"variable" "project" {
  "default" = "[PLACEHOLDER]"

  "type" = "string"
}
