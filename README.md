# AWS S3 Personal Archive
The personal S3 Archive project creates an AWS S3 bucket using Infrastructure as Code (IaC) via Terraform, which automatically moves files uploaded into the S3 bucket to Glacier Deep Archive.

## Table of Contents

- [Introduction](#introduction)
- [Cost Analysis](#cost-analysis)
- [Implementation](#implementation)
- [Bucket Features](#bucket-features)

## Introduction
The AWS S3 Glacier Deep Archive is cheap and convenient way to store data in the cloud. 
The bucket will utilized to store personal videos, files and photos that I do not need on a regular basis and can be archived.

This project will allow for the following:
* A single storage location for archived data that can be accessed from many different locations
* Frees up storage space on my devices to allow for more storage and better performance
* Cheaper cost to store large amounts of data compared to commercial methods (Google One, OneDrive etc.)
  
## Cost Analysis
After a quick cost analysis, the AWS S3 Glacier Deep Archive bucket will provide me a cost savings of **84.03%** annually. (As of December 2025)
Based on the following:
|Method|Cost per GB per year (AUD)|
|Google One| $0.22495 |
|AWS S3 (Glacier Deep Archive) | $0.036|

### Google One (Current)
I am currently on the Google One plan, which costs $44.99 AUD annualy for 200gb of cloud storage.
Which equates to $0.22495 AUD per GB per year.

**$0.22495 AUD per GB per year**

### AWS S3 Glacier Deep Archive
As per AWS S3 Glacier Deep Archive, it costs $0.002 USD per GB per month.
Resulting in an annual cost of $0.024 USD per GB.
With an average exchange rate of 1:1.50 (USD:AUD), the cost in AUD will be $0.036 AUD per GB per year.

**$0.036 AUD per GB per year**

Reference
https://aws.amazon.com/s3/pricing/?nc=sn&loc=4

## Implementation
### AWS configuration
First ensure AWS CLI is configured correctly on the system.

```aws configure```

### Apply main.tf with Terraform
The S3 bucket can be setup by running the following:

```terraform init```

```terraform plan```

```terraform apply```

## Bucket features
### Versioning

Versioning is enabled on the bucket to retain all previous versions of objects. This ensures historical data is preserved and prevents accidental overwrites or deletions.

### Encryption

Server-side encryption (AES256) is configured to automatically encrypt all files stored in the bucket, providing data security at rest.

### Lifecycle Rules

Lifecycle rules automatically transition both current and noncurrent object versions to Glacier Deep Archive, reducing storage costs for rarely accessed files.

