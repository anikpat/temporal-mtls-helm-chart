## Temporal io helm chart example with mtls enabled

### The following chart contains mtls certificate generation code as mentioned in temporal's mtls [example repository](https://github.com/temporalio/samples-server/tree/main/tls/tls-simple)

### Assumptions:
- I have used Azure cloud for the example, you can change the creds and alter az cli commands according to your requirement.

### References
- The helm chart has been copied over from temporals helm repository [here](https://github.com/temporalio/helm-charts)

### Usage
- Helm chart values-dev.yaml config has been created with RDBMS database example.
- Change the values in dev-values.yaml according to your requirement.
- Pipelines have been created as examples to run the helm chart to deploy to an existing kubernetes cluster.

### Note
> It is not recommended to use self-signed certificates in production. Please use a valid CA certificate.


### Temporal version
> Current Temporal version in the chart is [v1.21.2](https://github.com/temporalio/temporal/releases/tag/v1.21.2)