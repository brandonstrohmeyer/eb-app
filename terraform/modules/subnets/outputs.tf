output "public" {
    value = {
      "${aws_subnet.public.tags["Name"]}" = aws_subnet.public.id
        }
}

/* 
Private subnets are disabled due to AWS resource cost and not 
required for Lemony. I have left the code here commented out
to serve as an example.

output "private" {
    value = {
        for subnet in aws_subnet.private:
        subnet.tags["Name"] => subnet.id
    }
}

*/