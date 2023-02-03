#==============================================================================#
#                                                                              #
#                                 MIT License                                  #
#                                                                              #
#                       Copyright (c) 2023 Skyfarm                             #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a copy #
#of this software and associated documentation files (the Software), to deal #
# in the Software without restriction, including without limitation the rights #
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell   #
#    copies of the Software, and to permit persons to whom the Software is     #
#           furnished to do so, subject to the following conditions:           #
#                                                                              #
#The above copyright notice and this permission notice shall be included in all#
#               copies or substantial portions of the Software.                #
#                                                                              #
#  THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  #
#   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  #
#    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER    #
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, #
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE #
#                                  SOFTWARE.                                   #
#                                                                              #
#==============================================================================#
resource "kubernetes_manifest" "configmap_trudesk_config_yml" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "config.yml" = <<-EOT
      {
        "tokens": {
          "secret": "SECRET_USED_TO_HASH"
        }
      }
      EOT
    }
    kind = "ConfigMap"
    metadata = {
      name = "trudesk-config-yml"
      namespace = "default"
    }
  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "deployment_mongo" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "mongo"
      }
      "name" = "mongo"
      "namespace" = "default"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "io.kompose.service" = "mongo"
        }
      }
      "strategy" = {
        "type" = "Recreate"
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "kompose.cmd" = "kompose convert"
            "kompose.version" = "1.26.1 (a9d05d509)"
          }
          "creationTimestamp" = null
          "labels" = {
            "io.kompose.service" = "mongo"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "mongo:4.4.6"
              "livenessProbe" = {
                "initialDelaySeconds" = 15
                "periodSeconds" = 20
                "tcpSocket" = {
                  "port" = 27017
                }
              }
              "name" = "mongo"
              "ports" = [
                {
                  "containerPort" = 27017
                },
              ]
              "readinessProbe" = {
                "initialDelaySeconds" = 5
                "periodSeconds" = 10
                "tcpSocket" = {
                  "port" = 27017
                }
              }
              "resources" = {}
              "volumeMounts" = [
                {
                  "mountPath" = "/var/lib/mongo"
                  "name" = "mongo"
                },
                {
                  "mountPath" = "/data/db"
                  "name" = "mongo-claim0"
                },
              ]
            },
          ]
          "restartPolicy" = "Always"
          "volumes" = [
            {
              "name" = "mongo"
              "persistentVolumeClaim" = {
                "claimName" = "mongo"
              }
            },
            {
              "name" = "mongo-claim0"
              "persistentVolumeClaim" = {
                "claimName" = "mongo-claim0"
              }
            },
          ]
        }
      }
    }
    
  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "persistentvolumeclaim_mongo" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "mongo"
      }
      "name" = "mongo"
      "namespace" = "default"
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = "1Gi"
        }
      }
    }
    
  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "persistentvolumeclaim_mongo_claim0" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "labels" = {
        "app" = "mongo-claim0"
      }
      "name" = "mongo-claim0"
      "namespace" = "default"
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = "1Gi"
        }
      }
    }
  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "service_mongo" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "mongo"
      }
      "name" = "mongo"
      "namespace" = "default"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "27017"
          "port" = 27017
          "targetPort" = 27017
        },
      ]
      "selector" = {
        "io.kompose.service" = "mongo"
      }
    }

  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "deployment_trudesk" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "trudesk"
      }
      "name" = "trudesk"
      "namespace" = "default"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "io.kompose.service" = "trudesk"
        }
      }
      "strategy" = {
        "type" = "Recreate"
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "kompose.cmd" = "kompose convert"
            "kompose.version" = "1.26.1 (a9d05d509)"
          }
          "creationTimestamp" = null
          "labels" = {
            "io.kompose.service" = "trudesk"
          }
        }
        "spec" = {
          "imagePullSecrets" = [
            {
              name = "regcred"
            }
          ]
          "containers" = [
            {
              "env" = [
                {
                  "name" = "NODE_ENV"
                  "value" = "production"
                },
                {
                  "name" = "TD_MONGODB_DATABASE"
                  "value" = "trudesk"
                },
                {
                  "name" = "TD_MONGODB_SERVER"
                  "value" = "mongo"
                },
                {
                  "name" = "TRUDESK_DOCKER"
                  "value" = "true"
                },
              ]
              "image" = "10.244.217.7:32488/dipal/trudesk:v1"
              "livenessProbe" = {
                "initialDelaySeconds" = 15
                "periodSeconds" = 20
                "tcpSocket" = {
                  "port" = 8118
                }
              }
              "name" = "trudesk"
              "ports" = [
                {
                  "containerPort" = 8118
                },
              ]
              "readinessProbe" = {
                "initialDelaySeconds" = 5
                "periodSeconds" = 10
                "tcpSocket" = {
                  "port" = 8118
                }
              }
              "resources" = {}
              "volumeMounts" = [
                {
                  "mountPath" = "/usr/src/trudesk/public/uploads"
                  "name" = "trudesk-uploads"
                },
                {
                  "mountPath" = "/usr/src/trudesk/backups"
                  "name" = "trudesk-backups"
                },
                {
                  "mountPath" = "/usr/src/trudesk/config.yml"
                  "name" = "trudesk-config-yml"
                  "readOnly" = true
                  "subPath" = "config.yml"
                },
              ]
            },
          ]
          "restartPolicy" = "Always"
          "volumes" = [
            {
              "name" = "trudesk-uploads"
              "persistentVolumeClaim" = {
                "claimName" = "trudesk-uploads"
              }
            },
            {
              "name" = "trudesk-backups"
              "persistentVolumeClaim" = {
                "claimName" = "trudesk-backups"
              }
            },
            {
              "configMap" = {
                "name" = "trudesk-config-yml"
              }
              "name" = "trudesk-config-yml"
            },
          ]
        }
      }
    }
    
  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "service_trudesk" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "trudesk"
      }
      "name" = "trudesk"
      "namespace" = "default"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "8118"
          "port" = 8118
          "targetPort" = 8118
        },
      ]
      "selector" = {
        "io.kompose.service" = "trudesk"
      }
    }
  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "persistentvolumeclaim_trudesk_uploads" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "trudesk-uploads"
      }
      "name" = "trudesk-uploads"
      "namespace" = "default"
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = "1Gi"
        }
      }
    }
  }
}
#-------------------------------------------------------------------------------------
resource "kubernetes_manifest" "persistentvolumeclaim_trudesk_backups" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "trudesk-backups"
      }
      "name" = "trudesk-backups"
      "namespace" = "default"
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = "500Mi"
        }
      }
    }
    
  }
}