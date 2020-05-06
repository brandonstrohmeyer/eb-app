#!/usr/bin/env python3

from python_terraform import *
from packerpy import PackerExecutable

# Run Terraform Init and Terraform Apply for a given directory
def InitAndApply(dir):
    t = Terraform(working_dir=dir)
    t.init(capture_output=False)
    (ret, out, err) = t.apply(capture_output=False, skip_plan=True)
    output = t.output()

    if ret == 0:
        return output
    else:
        raise Exception("Terraform failed to Apply", err)

# Build eb-app AMI in specified environment
def BuildAMI (template, vars):
    print("\nBuilding AMI with Packer, this will take a minute...")
    p = PackerExecutable("/usr/local/bin/packer")
    (ret, out, err) = p.build(
        template,
        var=vars
        )
    if ret == 0:
        print("ok")
    else:
        raise Exception("Packer AMI failed to build", err)

if __name__ == '__main__':
    # Run Terraform Init and Apply on the 'build' environment, return outputs
    buildOutputs = InitAndApply('./terraform/build')

    # Build app AMI via Packer
    BuildAMI(
        './packer/eb-app-ami.json',
        { 'build_vpc_id': buildOutputs['build_vpc']['value'], 'build_subnet_id': buildOutputs['build_subnet']['value'] }
        )

    # Run Terraform Init and Apply on the 'prod' environment
    InitAndApply('./terraform/production')
