##NGINX

resource "kubernetes_ingress_v1" "konoha-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "konoha"
    namespace = "default"
    annotations = {
        "cert-manager.io/cluster-issuer" = "konoha-issuer"
  }
  }
  spec {
    ingress_class_name = "nginx"
    tls {
      secret_name = "konoha-secret"
      hosts = ["konoha.devopsnetwork.net"] 
    }
    rule {
      host = konoha.devopsnetwork.net"  
      http {
        path {
          path = "/"
          backend {
            service {
              name = "konoha-svc"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

##ALB

#resource "kubernetes_ingress_v1" "konoha" {
#  wait_for_load_balancer = true
#  metadata {
#    name = "konoha"
#    namespace = "konoha"
#    annotations = {
#        "alb.ingress.kubernetes.io/load-balancer-name" = "konoha"
#        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
#        "alb.ingress.kubernetes.io/target-type"        = "ip"                                       
#        "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-west-2:083772204804:certificate/2318624b-af04-4da9-984f-99a68ba155cc"
#  }
#  }
#  spec {
#    ingress_class_name = "alb"
#    default_backend {
#      service {
#        name = "konoha-svc"
#        port {
#          number = 80
#        }
#      }
#    }
#    rule {
#      host = "konoha.devopsnetwork.net"  
#      http {
#        path {
#          path = "/"
#          path_type = "Exact"
#          backend {
#            service {
#              name = "konoha-svc"
#              port {
#                number = 80
#              }
#            }
#          }
#        }
#      }
#    }
#  }
#}
