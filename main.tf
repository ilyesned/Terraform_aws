provider "aws" {
  profile = "myTeraaformProfile"
  region  = "us-west-1"  # Remplace par la région que tu utilises
}
resource "aws_instance" "foo" {
	 ami = "ami-05fa00d4c63e32376" # us-west-2
	 instance_type = "t2.micro"
	 tags = {
	 	Name = "TF-Instance"
 	}
}

