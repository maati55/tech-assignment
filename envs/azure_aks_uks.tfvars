# Common parameters
environment = "dev"
location    = "UK south"
UID         = "techassignment"

# AKS parameters
network_plugin                  = "azure"
api_server_authorized_ip_ranges = ["90.208.117.182/32"]
enable_private_cluster          = false

vm_size             = "Standard_D1_v2"

# node_pools = [
# {
#     name                = "core"
#     min_count           = 1
#     max_count           = 1
#     # vm_size             = ""
#     # availability_zones  = ["1", "2"]
#     node_taints         = ["dedicated=elasticStack:NoSchedule"]
# }
# ]
