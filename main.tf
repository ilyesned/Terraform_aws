provider "aws" {
  profile = "myTeraaformProfile"
  region  = "eu-west-1"  # Remplace par la région que tu utilises
}
resource "aws_instance" "foo" {
	 ami = "ami-0983f1f9ba9026e4e" # us-west-1
	 instance_type = "t2.micro"
	 tags = {
	 	Name = "TF-Instance"
 	}
}

