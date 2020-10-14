# terraform-aws-organizations

A terraform module to AWS Organizations and child resources, like organizational units, accounts, tag policies and SCP Service Control Policies. Inspired by and adapted from [this doc](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html).

Read the [AWS Organizations docs Best Practices ](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_best-practices_mgmt-acct.html).

WARNING! This Repo is mirrored from [Gitlab](https://gitlab.com/arkhoss/terraform-aws-organizations)

## Assumptions

* You have an AWS Account with AWS Organizations enable
* You have full access to AWS Organizations


## Usage example

A full example is contained in the [examples/basic directory](https://gitlab.com/arkhoss/terraform-aws-organizations/-/tree/master/examples).

```hcl

    module "my-org" {
        source             = "./terraform-aws-organizations"

        my_org = "something here"

        ous = {
          "name" = "some org unit"
        }

        accounts = {
          "name"  = "another account"
        }

        tags     = var.tags
    }

```

## Conditional creation


```hcl



```

### Resources Names

Name of the resources in AWS will follow a predefined pattern, like:

```
prefix + resource service + resource name
```

## Other documentation

* [Quotas for AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html): specifies quotas that affect AWS Organizations..
* [AWS Organizations FAQ](https://aws.amazon.com/organizations/faqs/): Frequently Asked Questions

## Doc generation

Code formatting and documentation for variables and outputs is generated using [pre-commit-terraform hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses [terraform-docs](https://github.com/segmentio/terraform-docs).

Follow [these instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install) to install pre-commit locally.

And install `terraform-docs` with `go get github.com/segmentio/terraform-docs` or `brew install terraform-docs`.

## Contributing

Report issues/questions/feature requests on in the [issues](https://gitlab.com/arkhoss/terraform-aws-organizations/-/issues) section.

Full contributing [guidelines are covered here](https://gitlab.com/arkhoss/terraform-aws-organizations/-/blob/master/CONTRIBUTING.md).

## Change log

The [changelog](https://gitlab.com/arkhoss/terraform-aws-organizations/-/blob/master/CHANGELOG.md) captures all important release notes from v1.0.0

## Authors

Created by:

- David Caballero [Gitlab](https://gitlab.com/arkhoss) | [Github](https://github.com/arkhoss) | d@dcaballero.net

## License

MIT License

Copyright (c) 2020 The terraform-aws-organizations module Authors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->