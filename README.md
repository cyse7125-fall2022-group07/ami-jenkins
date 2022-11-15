# Launch Jenkins AMI using Packer

## Pre-requirements
- Configure AWS cli (AWS account set-up with proper profile credentials/region needed).
- Install Packer

## ubuntu.packer.pkr.hcl
```
We will provide all the configuration information necessary to construct an AMI with packer in this file.
```
## variables.pkr.hcl
```
We would pass variables in this file that we would then use to generate the AMI.
```

## buildscript.sh
```
While building the AMI file, we will install all the packages from this file.
```

## .github/workflow file
```
The github action workflow file will be used, via which all of the github actions' processes will be carried out, and the AMI will subsequently be built and shared across all of the accounts listed in the variables file.
```