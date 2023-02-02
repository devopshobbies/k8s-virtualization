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
#==============================================================================#
#                                                                              #
#                             Dipal services                                   #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
# Deploys pyrador service
module "dipal_pyrador" {
  source = "modules/pyrador"
  depends_on = [helm_release.kafka,helm_release.redis]
  #..............general variables...............................................
  pyrador_namespace = "default"
  pyrador_name = "pyrador"
  pyrador_replica = "1"
  pyrador_pull_secret = "regcred"
  pyrador_image_address = "10.244.217.7:32488/dipal/pyrador"
  pyrador_image_tag = "latest"
  #..............configmap variables.............................................
  pyrador_app_port = 5000
  pyrador_redis_host = "redis-master"
  pyrador_redis_port = 6378
  pyrador_kafka_host = "kafka"
  pyrador_kafka_port = 9092
  pyrador_kafka_client_id = "pyrador"
  pyrador_kafka_group_id = "pyrador"
  #..............secret variables................................................
  pyrador_keycloak_auth_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAljPpshPcrypFRkhxMZraXgbNmB0q3XQkcCcrWy3L+C1J2YMprp9a5UOi/Evl59Key2hVbYO76y/TipodcsSzAA1OhHJm2PFacdN9yia/HoW8VJ4u7tm62cLTrbmiPsjjEUfsqShPdYby01549iLlfb+oXX2DfC9JkhekX6nCEO/slPZ7TKDs30Gwd5BlqaaKFgpN2BkMipvrTfMhiQNWtV8NG7ZcJ704JcscVzAhaeXRsA9S1TcHstTjUhW/bZyyhPwO5qzHNh9sIr0jc/IPy7QUHEGH834CTckw+70lhtiIrQxIFa1JBxyJzdrRi1LiWIC2FBnAHyfauUgddxIrRwIDAQAB"
  pyrador_redis_password = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
# Deploys iguana service
module "dipal_iguana" {
  source = "modules/iguana"
  depends_on = [helm_release.kafka,helm_release.redis]
  #..............general variables...............................................
  iguana_namespace = "default"
  iguana_name = "iguana"
  iguana_replica = "1"
  iguana_pull_secret = "regcred"
  iguana_image_address = "10.244.217.7:32488/dipal/iguana"
  iguana_image_tag = "latest"
  #..............configmap variables.............................................
  iguana_app_port = 2000
  iguana_redis_host = "redis-master"
  iguana_redis_port = 6378
  iguana_fs_public_url = "10.98.25.159"
  iguana_fs_bucket_name = "9000"
  iguana_kafka_host = "kafka"
  iguana_kafka_port = 9092
  iguana_kafka_client_id = "iguana"
  iguana_kafka_group_id = "iguana"

  #..............secret variables................................................
  iguana_keycloak_auth_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAljPpshPcrypFRkhxMZraXgbNmB0q3XQkcCcrWy3L+C1J2YMprp9a5UOi/Evl59Key2hVbYO76y/TipodcsSzAA1OhHJm2PFacdN9yia/HoW8VJ4u7tm62cLTrbmiPsjjEUfsqShPdYby01549iLlfb+oXX2DfC9JkhekX6nCEO/slPZ7TKDs30Gwd5BlqaaKFgpN2BkMipvrTfMhiQNWtV8NG7ZcJ704JcscVzAhaeXRsA9S1TcHstTjUhW/bZyyhPwO5qzHNh9sIr0jc/IPy7QUHEGH834CTckw+70lhtiIrQxIFa1JBxyJzdrRi1LiWIC2FBnAHyfauUgddxIrRwIDAQAB"
  iguana_redis_password = "PoI456ZxC"
  iguana_S3_access_key = "admin"
  iguana_S3_secret = "XIdX48556C"
}
#-------------------------------------------------------------------------------
# Deploys pigeons service
module "dipal_pigeons" {
  source = "modules/pigeons"
  depends_on = [helm_release.kafka,helm_release.redis]
  pigeons_namespace = "default"
  pigeons_name = "pigeons"
  pigeons_replica = "1"
  pigeons_pull_secret = "regcred"
  pigeons_image_address = "10.244.217.7:32488/dipal/pigeons"
  pigeons_image_tag = "latest"
  #..............configmap variables.............................................
  pigeons_app_port = 5000
  pigeons_redis_host = "redis-master"
  pigeons_redis_port = 6378
  pigeons_kafka_host = "kafka"
  pigeons_kafka_port = 9092
  pigeons_kafka_client_id = "pigeons"
  pigeons_kafka_group_id = "pigeons"
  pigeons_tls_reject = "0"
  #..............secret variables................................................
  pigeons_redis_password = "PoI456ZxC"
  pigeons_email_from = "Comfortel <comfortec@yandex.ru>"
  pigeons_email_user = "comfortec"
  pigeons_email_pass = "orvavpirmuiqqrip"
  pigeons_email_host = "smtp.yandex.ru"
  pigeons_email_port = "465"
  pigeons_sms_url = "https://smpp.comfortel.pro:13013"
  pigeons_sms_pass = "Chuichi2aiti"
  pigeons_sms_user = "techpal"
  pigeons_sms_sender = "Comfortel"
  pigeons_firebase_account_type = "service_account"
  pigeons_firebase_project_id = "comfortech-12a15"
  pigeons_firebase_private_key_id = "481c511d487607199bf67ebed2f6f3e555597b41"
  pigeons_firebase_private_key = "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCdOYq29CxrkTNt\n1XfIxLjnR6yUsemRHYoIho1FYxruP5p0957ZVmdv5AXbwOmecTYXwy8FBlyVFNBE\na7TKDEP1BMlBK7MwN23431DDjKYx/YQjksDb2XAz+ykosv0A3G0r9nJjr8iPmDEa\nwXK3U5ISdX0yMW/kSfWkQ3kBCgdL1G1FtWQBuxp83EHAgv+GW3wcIr4srZmOHjit\nI2BEwfzUhZ/GpMg7sQkItzJ33tTmsuMownas6hknKCqRVr8DzZ9JZZ2rLaQZvaUN\nskd+/QlyejHN9APes0Cc1kXEbzJU1a3Mgm9fkWUCtewth54JmbZn+sQsiBvrAg+x\n8IPALoEpAgMBAAECggEAHWgYjZEcaM8a7Sle0t6Wje2ONi6TlsiNW3xdGnQHorWj\nPErfO1vJk3g0704E9BVNLoMbfYdb1Cd1L8LsaNkD8eVABjA3/uXzK/gKyVR6dkGq\nUCP/7e7cqWBJ6bqWjy1rPuyEpygG7XKkBpLVk7vuB4VRkgyEltCNgPh8vqjDRheN\nTcweIH4oEXTgYhJ0Krx9zU/ZYxchc/S6g/GFJNVSXUQAL31U4GzqP857sSAnQ2OT\n4Ue6JYGTgSPd3ogWOXJGuxn+9Mb+IwapV8T8KADBMZhRqkD9YeKb8s5/qo0KQBCV\naSmL+ZYV7KkHZWie26hhTTvqj/Ll92+cyFF/LfIHzQKBgQDXie9+HslGvdVQFayD\nIfnZD3DaGn7y+FNUOAmw8jMLhsy7eutHgHmpOwW+ctJSlzdrP6lbFhFxdiZ6ok8L\nmZFeZJTv5fsNCrGoQ9yLnZCnrCEJ2BUgSCyS0TTem3p2+4tQgZcbzj32fI7KR5v8\n8BQcK1fnBgZ6XztMLj9qFv1RxQKBgQC6vTs8PMZCoaNici+nT7/KLmepkEyz9cJn\nQp2uCohmy0zAZ9Me7DSxLnaIOom1zmBJWIK/48/41FH2eVxyH5Pd1F5wIjrTX5/Y\nAFpX2Rz0AKMn4BhXEU1umuxShQRQ5aUJO0xf/x2h5TdKcnlzuMYHDfBFr8WuN0/H\nXSdS2DRcFQKBgHXCWOTRMSrDQK42iUBD6dubwg6Hd2CMKArVawYP7a+YgHbV24H/\nQXkiVCsPVLXnBFJGP+MSFYmmAbPyxbkSuAeYcH75acZgV1wVZ4OoHIZfVtWoBzLR\n+/hi8L3GuIwVNrJPex2n+taWivUdVq5FBNe3HpmMAzIMobsncWInGVP5AoGBAKGR\nXnIE50j5T0K7Jw3syzTkJ56nEiZWSWhMU98kj9XYqkSC0ECeAA0Y9Udy1nlt4RM0\nuJPMSMGy+mN1p426UpaIy1jb1OfTgZpC2+fMGufmsUOr+YNDnipHcpcHLa/MsZkm\nLDOWqI3No6QPHZQJV5T881ln9nKAus70gzSDifHtAoGBAI6L/8RXh/9TSqBs8QXV\nyWYIPrOfAVXQnbxMSlbFP/9Y4VDyDOtWLU577VEPpzzr9on54D6grcxH50kyruA1\np0nio67uyRdgGqOCbEKDpeI7fDWLZ4DeCcaGn8i78gXylSey6rG5NTbKCqSDMDlX\nKzWiIoOL1qfCWhjHAWzY52Pb\n-----END PRIVATE KEY-----\n"
  pigeons_firebase_account_client_email = "firebase-adminsdk-2mrcb@comfortech-12a15.iam.gserviceaccount.com"
  pigeons_firebase_account_client_id = "104778641386557489050"
  pigeons_firebase_account_auth_url = "https://accounts.google.com/o/oauth2/auth"
  pigeons_firebase_account_token_uri = "https://oauth2.googleapis.com/token"
  pigeons_firebase_account_auth_provider_x509_cert_url = "https://www.googleapis.com/oauth2/v1/certs"
  pigeons_firebase_account_auth_client_x509_cert_url = "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-2mrcb%40comfortech-12a15.iam.gserviceaccount.com"
  pigeons_firebase_default_message_title = "Comfortech"
  pigeons_firebase_default_message_body = "Empty message"
  pigeons_firebase_default_message_image_uri = "https://sun1-26.userapi.com/s/v1/if1/2Dhrl9gqlWW7XVRbXiBRdtduvtw4PTiYRE0K9A9qVfypNzoERhBxUj_ch5VP6-RBWSyvQ9_q.jpg?size=400x0&quality=96&crop=108,115,484,484&ava=1"
  pigeons_firebase_registration_token = "AIzaSyCf5LhHwWcWWgjKCHv1I32lko6QusPty-I"
}
#-------------------------------------------------------------------------------
# Deploys crow service
module "dipal_crow" {
  source = "modules/crow"
  depends_on = [helm_release.kafka,helm_release.redis,helm_release.mongodb]
  crow_namespace = "default"
  crow_name = "crow"
  crow_replica = "1"
  crow_pull_secret = "regcred"
  crow_image_address = "10.244.217.7:32488/dipal/crow"
  crow_image_tag = "latest"
  #..............configmap variables.............................................
  crow_mongodb_base_url = "dipal-mongodb"
  crow_mongodb_port = "27017"
  crow_external_mongodb_base_url = "dipal-mongodb"
  crow_external_mongodb_username="root"
  crow_mongodb_username = "root"
  crow_mongodb_dbname= "comfortech"
  crow_external_mongodb_db_name = "external_db"
  crow_external_mongodb_debug = "false"
  crow_mongodb_debug = "false"
  crow_external_mongodb_port = "27017"
  crow_default_place_id = "631749ea24fb4fc46bbe08e6"
  crow_default_utilities_service_id = "631749ee24fb4f3828be08f0"
  crow_default_intercom_service_id = "631749ee24fb4f6c11be08f4"
  crow_default_camera_service_id = "631749ee24fb4f8c9ebe08f6"
  crow_redis_host = "redis-master"
  crow_vault_host = "vault"
  crow_vault_port= 8200
  crow_redis_port = "6378"
  crow_kafka_host = "kafka"
  crow_kafka_port = "9092"
  crow_kafka_client_id = "comfortech-dataland"
  crow_kafka_group_id = "comfortech-dataland"
  crow_keycloak_base_url = "http://keycloak"
  crow_keycloak_port = "8080"
  crow_keycloak_realm = "comfortech_staging"
  crow_keycloak_grant_type = "password"
  crow_next_try_time = "60000"
  crow_expiration_time = "60000"
  crow_billing_base_url = "https://api.uut-telecom.ru/api/v1.0"
  crow_trudesk_host = "trudesk"
  crow_trudesk_port = "8118"
  crow_trudesk_username = "admin"
  crow_trudesk_user_role_id = "63973275983167ba4b2b405a"
  crow_trudesk_default_ticket_type = "63973275983167ba4b2b4054"
  crow_trudesk_default_ticket_priority = "6397327ec5a5299a427550f1"
  #..............secret variables................................................
  crow_external_mongodb_password = "PoI456ZxC"
  crow_mongodb_password = "PoI456ZxC"
  crow_redis_password = "PoI456ZxC"
  crow_vault_root = "bm90aGluZw=="
  crow_vault_token_path = "dmF1bHQvZGF0YS92YXVsdF9yb290X3Rva2VuLmtleQ=="
  crow_vault_keys_path = "dmF1bHQvZGF0YS9zZWFsaW5nX2tleXMua2V5"
  crow_keycloak_client_account_id="0d68a12c-7e3e-4995-8604-bc7eb3327fd4"
  crow_keycloak_client_id= "admin-cli"
  crow_keycloak_local_client_id = "comfortech"
  crow_keycloak_username= "admin"
  crow_keycloak_password= "PoI456ZxC"
  crow_trudesk_password="PoI456ZxC"
  crow_security_key="971ebba1602e952acd7a549ca3826e41"
}
#-------------------------------------------------------------------------------
# Deploys goose service
module "dipal_goose" {
  source = "modules/goose"
  depends_on = [helm_release.kafka,helm_release.redis]
  goose_namespace = "default"
  goose_name = "goose"
  goose_replica = "1"
  goose_pull_secret = "regcred"
  goose_image_address = "10.244.217.7:32488/dipal/goose"
  goose_image_tag = "latest"
  #..............configmap variables.............................................
  goose_app_port = 2000
  goose_redis_host = "redis-master"
  goose_redis_port = 6378
  goose_kafka_host = "kafka"
  goose_kafka_port = 9092
  goose_kafka_client_id = "goose-consumer"
  goose_kafka_group_id = "goose-consumer"
  #..............secret variables................................................
  goose_redis_password = "PoI456ZxC"

}
