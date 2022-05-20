# SSO Integration

This template is used to create SSO integrations.

## Documentation

- [SSO integration documentation](https://auth0.com/docs/customize/integrations/marketplace-partners/sso-integrations-for-partners)
- [Custom OAuth2 Connection documentation](https://auth0.com/docs/authenticate/identity-providers/social-identity-providers/oauth2s)

## Getting started

This repo contains all the files required to create an integration that our mutual customers can install. In the `integration` folder you'll find the following files:

### `recipe.json`

This file defines the template for the [SAML settings](https://auth0.com/docs/authenticate/protocols/saml/saml-configuration/customize-saml-assertions#saml-assertion-attributes) in Auth0. Use the documentation linked above to add settings as needed to the `samlp` object. Values that are the same as our defaulst do not need to be defined. Values that need to be entered by the tenant admin are defined in the configuration file explained below.

### `installation_guide.md`

This file contains a template for the guide that will be published along with your integration. Look for `TODO` items in this file to find where your instructions should go. Please keep the existing format as much as possible and add any additional troubleshooting steps that might be helpful. 

### `configuration.json` 

This file defines the configuration fields that are required by the tenant admin, if needed. Fields should be defined using an object including the following properties:

* `name` - Required; either `callbacks` for a callback URL or `addon.samlp.SETTING_NAME` for a property within the SAML configuration object.
* `label` - Required; the field name to be shown to the tenant admin.
* `dataType` - Optional; `string` for a plain text field or `uri` for URL validation
* `deployValue` - Optional; the value to use when creating or updating an entity using the deploy scripts explained below

If, for example, your service needed an `audience` value from an admin, the `configuration.json` file would look like this:

```json
[
    {
        "name": "addon.samlp.audience",
        "label": "Audience"
    }
]
```

## Build and test your SSO Integration

We've included a few helpful scripts in a `Makefile` that should help you build, test, and submit a quality integration. You can develop your Action locally and use the commands below to lint, test, and deploy to a tenant.

The commands below require Docker to be installed and running on your local machine (though no direct Docker experience is necessary). Download and install Docker [using these steps for your operating system](https://docs.docker.com/get-docker/). 

* `make test` - this will run the Jest spec file explained above, along with a few other integrity checks. This check is run in a GitHub Action located in `.github/workflows/test.yaml`.
* `make lint` - this will check and format your JS code according to our recommendations. This check is run in a GitHub Action located in `.github/workflows/lint.yaml`.
* `make deploy_init` - use this command to initialize deployments to a test tenant. You will need to [create a machine-to-machine application](https://auth0.com/docs/get-started/auth0-overview/create-applications/machine-to-machine-apps) authorized for the Management API with permissions `read:clients`, `update:clients`, `delete:clients`, and `create:clients`.
* `make deploy_get_token` - use this command after `deploy_init` to generate an access token
* `make deploy_create` - use this command to create a new application based on the current integration files. If this successfully completes, you will see a URL in your terminal that will allow you to enable connections and try the application.
* `make deploy_update` - use this command to update the created application based on the current integration files.
* `make deploy_delete` - use this command to destoy the application.

## Submit for review

When your integration has been written and tested, it's time to submit it for review.

1. Replace the `media/256x256-logo.png` file with an image of the same size and format (256 pixel square on a transparent background)
1. If you provided value-proposition columns and would like to include images, replace the `media/460x260-column-*.png` files with images of the same size and format; otherwise, delete these images before submitting
1. Run `make zip` in the root of the integration package and upload the resulting archive to the Jira ticket.

If you have any questions or problems with this, please reply back on the support ticket!

## What is Auth0?

Auth0 helps you to:

* Add authentication with [multiple authentication sources](https://auth0.com/docs/identityproviders), either social like **Google, Facebook, Microsoft Account, LinkedIn, GitHub, Twitter, Box, Salesforce, among others**, or enterprise identity systems like **Windows Azure AD, Google Apps, Active Directory, ADFS or any SAML Identity Provider**.
* Add authentication through more traditional [username/password databases](https://auth0.com/docs/connections/database/custom-db).
* Add support for [linking different user accounts](https://auth0.com/docs/link-accounts) with the same user.
* Support for generating signed [JSON Web Tokens](https://auth0.com/docs/jwt) to call your APIs and **flow the user identity** securely.
* Analytics of how, when, and where users are logging in.
* Pull data from other sources and add it to the user profile, through [JavaScript rules](https://auth0.com/docs/rules/current).

## Issue Reporting

If you have found a bug or if you have a feature request, please report them at this repository issues section. Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

## Author

[Auth0](https://auth0.com)

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file in this repo for more info.
