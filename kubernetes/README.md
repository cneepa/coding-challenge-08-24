# Problem

Deploy Nginx in Kubernetes with Dynamic Scaling: Deploy a Nginx web server with dynamic scaling capabilities. Scale up to a maximum of 20 replicas when CPU or memory usage exceeds 80%. Always maintain a minimum of 5 replicas, with a focus on distributing replicas across different nodes for improved availability

# Implementation

The following section consists of the explanation for the solution provided.
First to cater to the requirements in the question.

#### Dynamic Scaling based of memory and cpu utilization

To achieve that kubernetes provides a resource known as Horizontal Pod Autoscaler. It controls the number of replicas for the deployment it is monitoring based on the current and target utilisation of the required resources by the pod.
The `minReplicas` field in the hpa ensures that the deployment will have that many number of pods all the time. `maxReplicas` ensures a cap on the number of pods it can scale up to if required.


#### High Availability

Affinity of a deployment ensures how the replicas are scheduled on nodes. To avoid all replicas being scheduled on the same node, pod anti affinity is being used. Anti affinity ensures the pod is not scheduled where a pod matching the label sector is already running. The condition where is ensured by the `topologyKey`. That the pod should not be scheduled on the same node or zone etc.
For this case it is set to node. The condition can be set to required or preferred during scheduling.

#### Best practices

`automountServiceAccountToken`: The service account token is required only if the workload needs to interact with the api server. If not required should be explicitly set to false as even if the deployment is not explicitly using service account, kubernetes automounts the default service account token to the pod.
If not required should be set to false, as done in this scenario.

`liveness/readiness probes`: Having a well defined liveness and readiness probe for the application is very important, for utilising the capabilities of Kubernetes to recover from certain situations where it could revive on a simple container restart or taking it out from the service endpoint if the pod isn't ready to serve traffic.

`securityContext`: Having the right security context is important to define how applications run and interact with the underlying infrastructure. The settings allow controlling the capabilities of a container process, restrict a container's access to the root filesystem, and prevent privilege escalation attacks. Best practice is to use a non root user and readonly filesystem for containers. But that would require modify the image being used to get i working. Hence skipped considering it as out of scope for the question.


