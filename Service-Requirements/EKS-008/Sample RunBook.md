Before proceeding to the EKS upgrades using any of the methdos such as in-place upgrade or blue/green consider gaining better understanding of below - 

Understand Deprecation Policies — Gain a deep understanding of how the Kubernetes deprecation policy works - https://kubernetes.io/docs/reference/using-api/deprecation-policy/. Be aware of any upcoming changes that may affect your existing applications. Newer versions of Kubernetes often phase out certain APIs and features, potentially causing issues for running applications.

Review Kubernetes Change Log (https://github.com/kubernetes/kubernetes/tree/master/CHANGELOG) — Thoroughly review the Kubernetes change log alongside Amazon EKS Kubernetes versions to understand any possible impact to your cluster, such as breaking changes that may affect your workloads.

Assess Cluster Add-Ons Compatibility (https://docs.aws.amazon.com/eks/latest/userguide/managing-add-ons.html#updating-an-add-on) — Amazon EKS doesn't automatically update an add-on when new versions are released or after you update your cluster to a new Kubernetes minor version. Review Updating an add-on to understand the compatibility of any existing cluster add-ons with the cluster version you intend to upgrade to.

Enable Control Plane Logging (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) — Enable control plane logging to capture logs, errors, or issues that can arise during the upgrade process. Consider reviewing these logs for any anomalies. Test respective cluster and/or integrate automated tests into  continuous integration workflow to assess version compatibility with your applications, controllers, and custom integrations.

Utilize kubectl Convert Plugin — Leverage the kubectl convert plugin (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-convert-plugin) to facilitate the conversion of Kubernetes manifest files between different API versions. This can help ensure that your configurations remain compatible with the new Kubernetes version.


Additionally Testing microservices, Custom Resource Definitions (CRDs), Role-Based Access Control (RBAC) roles, and Helm charts on an upgraded Amazon EKS cluster involves ensuring that your applications and configurations work seamlessly with the new Kubernetes version. Below is a step-by-step runbook to guide you through this process:

1. Preparation:
1.1. Backup Configurations:
Before proceeding with testing, ensure you have backups of critical configurations, CRDs, RBAC roles, and Helm charts.

1.2. Update Dependencies:
Make sure that any dependencies such as Helm, kubectl, and other tools are updated to versions compatible with the new Kubernetes version.

2. Update Helm Charts:
2.1. Update Chart Values:
Modify your Helm chart values to accommodate any changes or new features introduced in the upgraded Kubernetes version.

2.2. Dry Run:
Perform a dry run of the Helm upgrade to check for any potential issues without making actual changes:

bash
Copy code
helm upgrade --dry-run <release-name> <chart-path> -f <values-file>
2.3. Apply Helm Upgrade:
If the dry run is successful, proceed with the actual Helm chart upgrade:

bash
Copy code
helm upgrade <release-name> <chart-path> -f <values-file>
3. Test Microservices:
3.1. Deploy Microservices:
Deploy your microservices onto the upgraded EKS cluster:

bash
Copy code
kubectl apply -f <microservices-manifests>
3.2. Verify Pod Status:
Confirm that the microservices' pods are running without errors:

bash
Copy code
kubectl get pods
3.3. Perform Application Testing:
Execute comprehensive tests on your microservices to ensure they function correctly with the new Kubernetes version.

4. Test CRDs:
4.1. Apply CRDs:
Apply the Custom Resource Definitions (CRDs) onto the cluster:

bash
Copy code
kubectl apply -f <crd-manifests>
4.2. Verify CRD Instances:
Confirm that instances of the CRDs are created successfully:

bash
Copy code
kubectl get <crd-kind>
4.3. Validate CRD Functionality:
Perform tests to validate the functionality of the CRDs under the upgraded Kubernetes version.

5. Test RBAC Roles:
5.1. Apply RBAC Roles:
Apply RBAC roles and role bindings onto the cluster:

bash
Copy code
kubectl apply -f <rbac-manifests>
5.2. Verify Role Bindings:
Confirm that the RBAC role bindings are correctly associated with the relevant service accounts:

bash
Copy code
kubectl get rolebindings
5.3. Test RBAC Permissions:
Execute tests to ensure that RBAC permissions are enforced as expected for your microservices.

6. Post-Testing Steps:
6.1. Check Cluster Metrics:
Use tools like Prometheus or CloudWatch to monitor cluster metrics and ensure there are no abnormal resource utilization patterns.

6.2. Review Logs:
Review application and cluster logs for any errors or warnings that may have occurred during testing.

6.3. Update Documentation:
Update documentation with any changes made to configurations, RBAC roles, CRDs, and Helm charts during the testing process.

6.4. Communication:
Communicate the successful testing results to relevant stakeholders and teams.

7. Rollback Procedure (if necessary):
If testing reveals critical issues, be prepared to rollback the changes. Refer to Helm and kubectl documentation for rollback procedures.

Remember to adapt these steps based on the specific requirements and details of your microservices, CRDs, RBAC roles, and Helm charts. Always refer to the official documentation for the tools and frameworks you are using for the most accurate information.





