// Build new VPC to support the web app
module "vpc" {
  source        = "../modules/vpc"
  vpc_name      = "eb-app-vpc"
  vpc_cidr      = "10.144.0.0/16"
  key_pair_name = "deploy-key"
  public_key    = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCI9cmNV3IseTKpEs7FzDB/m7JwYP5HakemqAWKOxw1JvQRnUsHl/TliWBYSjDGzUzh1+i8pzoJ4tQvttNNgL9EvZn9EW9Hv9Bg0ORhQaBKu32h6g2IUuR3iAMc2NEZh0NdgV97hLlSpprRRNzYwgTkNSS6y2d2B6ZTEyivuX21KQIDAQAB"
}
