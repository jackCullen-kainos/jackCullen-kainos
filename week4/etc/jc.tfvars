account-id = "138588690193"
project = "kpa-jack-2023"
region = "eu-west-1"
environment = "jc-prd-1"
internal_domain_name = "jc-prd.local"

vpc_cidr_block = "10.0.0.0/16"

public-subnets = [
    "10.0.0.0/24",
    "10.0.1.0/24"
]

priv-subnet = [
    "10.0.2.0/24",
    "10.0.3.0/24"
]

s3-state-bucket = "kpa-jack-2023-state-s3-tfstate"

ngw-count = 1

trusted-ips = [
  "62.254.63.50/32",  # KAINOS BELFAST OFFICE
  "62.254.63.52/32",  # KAINON BELFAST VPN
  "195.89.171.5/32",  # KAINOS BELFAST VPN backup line
  "147.161.236.0/23", # Zscaler Ranges for UK
  "165.225.196.0/23",
  "165.225.198.0/23",
  "147.161.224.0/23",
  "165.225.80.0/22",
  "147.161.166.0/23",
  "147.161.224.0/23",
  "165.225.16.0/23",
  "165.225.80.0/22",
  "147.161.166.0/23",
  "147.161.140.0/23",
  "147.161.142.0/23",
  "147.161.144.0/23"
]