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
# defines the namespace where pigeons Should be created
variable "pigeons_namespace" {
  type = string
  default = "default"
}
#-------------------------------------------------------------------------------
# defines a name for pigeons service
variable "pigeons_name" {
  type = string
  default = "pigeons"
}
#-------------------------------------------------------------------------------
# defines the number of pigeons reploicas
variable "pigeons_replica" {
  type = string
  default = "1"
}
#-------------------------------------------------------------------------------
# defines image pull secret
variable "pigeons_pull_secret" {
  type = string
  default = "regcred"
}
#-------------------------------------------------------------------------------
# defines pigeons image address
variable "pigeons_image_address" {
  type = string
  default = "imageAddress"
}
#-------------------------------------------------------------------------------
# defines pigeons image tag
variable "pigeons_image_tag" {
  type = string
  default = "imageTag"
}
#==============================================================================#
#                                                                              #
#                             Configmap Variable Group                         #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines the app port for pigeons
variable "pigeons_app_port" {
  type = number
  default = 5000
}
#-------------------------------------------------------------------------------
#Defines redis host address
variable "pigeons_redis_host" {
  type = string
  default = "redis-master"
}
#-------------------------------------------------------------------------------
#Defines redis port number
variable "pigeons_redis_port" {
  type = number
  default = 6378
}
#-------------------------------------------------------------------------------
#Defines kafka host
variable "pigeons_kafka_host" {
  type = string
  default = "kafka"
}
#-------------------------------------------------------------------------------
#Defines kafka port number
variable "pigeons_kafka_port" {
  type = number
  default = 9092
}
#-------------------------------------------------------------------------------
#Defines kafka klient id
variable "pigeons_kafka_client_id" {
  type = string
  default = "pigeons"
}
#-------------------------------------------------------------------------------
#Defines kafka groupID
variable "pigeons_kafka_group_id" {
  type = string
  default = "pigeons"
}
#-------------------------------------------------------------------------------
#Defines pigeons tls reject unauthorized
variable "pigeons_tls_reject" {
  type = string
  default = "0"
}
#-------------------------------------------------------------------------------
#Defines pigeons db address
variable "pigeons_db_address" {
  type = string
  default = "dipal-mongodb"
}
#-------------------------------------------------------------------------------
#Defines pigeons db port
variable "pigeons_db_port" {
  type = string
  default = "27017"
}
#-------------------------------------------------------------------------------
#Defines pigeons db username
variable "pigeons_db_username" {
  type = string
  default = "root"
}
#-------------------------------------------------------------------------------
#Defines pigeons db username
variable "pigeons_db_name" {
  type = string
  default = "pigeons"
}
#==============================================================================#
#                                                                              #
#                             Secrets Variable Group                           #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines redis password
variable "pigeons_redis_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines email from
variable "pigeons_email_from" {
  type = string
  default = "Comfortel <comfortec@yandex.ru>"
}
#-------------------------------------------------------------------------------
#Defines email user
variable "pigeons_email_user" {
  type = string
  default = "comfortec"
}
#-------------------------------------------------------------------------------
#Defines email user
variable "pigeons_email_pass" {
  type = string
  default = "orvavpirmuiqqrip"
}
#-------------------------------------------------------------------------------
#Defines email host
variable "pigeons_email_host" {
  type = string
  default = "smtp.yandex.ru"
}
#-------------------------------------------------------------------------------
#Defines email port
variable "pigeons_email_port" {
  type = string
  default = "465"
}
#-------------------------------------------------------------------------------
#Defines sms url
variable "pigeons_sms_url" {
  type = string
  default = "https://smpp.comfortel.pro:13013"
}
#-------------------------------------------------------------------------------
#Defines sms tls certificate check
variable "pigeons_sms_tls_certificate_check" {
  type = string
  default = "0"
}
#-------------------------------------------------------------------------------
#Defines sms pass
variable "pigeons_sms_pass" {
  type = string
  default = "Chuichi2aiti"
}
#-------------------------------------------------------------------------------
#Defines sms user
variable "pigeons_sms_user" {
  type = string
  default = "techpal"
}
#-------------------------------------------------------------------------------
#Defines sms sender
variable "pigeons_sms_sender" {
  type = string
  default = "Comfortel"
}
#-------------------------------------------------------------------------------
#Defines firebase account type
variable "pigeons_firebase_account_type" {
  type = string
  default = "service_account"
}
#-------------------------------------------------------------------------------
#Defines firebase project id
variable "pigeons_firebase_project_id" {
  type = string
  default = "comfortech-12a15"
}
#-------------------------------------------------------------------------------
#Defines firebase private key id
variable "pigeons_firebase_private_key_id" {
  type = string
  default = "481c511d487607199bf67ebed2f6f3e555597b41"
}
#-------------------------------------------------------------------------------
#Defines firebase private key
variable "pigeons_firebase_private_key" {
  type = string
  default = "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCdOYq29CxrkTNt\n1XfIxLjnR6yUsemRHYoIho1FYxruP5p0957ZVmdv5AXbwOmecTYXwy8FBlyVFNBE\na7TKDEP1BMlBK7MwN23431DDjKYx/YQjksDb2XAz+ykosv0A3G0r9nJjr8iPmDEa\nwXK3U5ISdX0yMW/kSfWkQ3kBCgdL1G1FtWQBuxp83EHAgv+GW3wcIr4srZmOHjit\nI2BEwfzUhZ/GpMg7sQkItzJ33tTmsuMownas6hknKCqRVr8DzZ9JZZ2rLaQZvaUN\nskd+/QlyejHN9APes0Cc1kXEbzJU1a3Mgm9fkWUCtewth54JmbZn+sQsiBvrAg+x\n8IPALoEpAgMBAAECggEAHWgYjZEcaM8a7Sle0t6Wje2ONi6TlsiNW3xdGnQHorWj\nPErfO1vJk3g0704E9BVNLoMbfYdb1Cd1L8LsaNkD8eVABjA3/uXzK/gKyVR6dkGq\nUCP/7e7cqWBJ6bqWjy1rPuyEpygG7XKkBpLVk7vuB4VRkgyEltCNgPh8vqjDRheN\nTcweIH4oEXTgYhJ0Krx9zU/ZYxchc/S6g/GFJNVSXUQAL31U4GzqP857sSAnQ2OT\n4Ue6JYGTgSPd3ogWOXJGuxn+9Mb+IwapV8T8KADBMZhRqkD9YeKb8s5/qo0KQBCV\naSmL+ZYV7KkHZWie26hhTTvqj/Ll92+cyFF/LfIHzQKBgQDXie9+HslGvdVQFayD\nIfnZD3DaGn7y+FNUOAmw8jMLhsy7eutHgHmpOwW+ctJSlzdrP6lbFhFxdiZ6ok8L\nmZFeZJTv5fsNCrGoQ9yLnZCnrCEJ2BUgSCyS0TTem3p2+4tQgZcbzj32fI7KR5v8\n8BQcK1fnBgZ6XztMLj9qFv1RxQKBgQC6vTs8PMZCoaNici+nT7/KLmepkEyz9cJn\nQp2uCohmy0zAZ9Me7DSxLnaIOom1zmBJWIK/48/41FH2eVxyH5Pd1F5wIjrTX5/Y\nAFpX2Rz0AKMn4BhXEU1umuxShQRQ5aUJO0xf/x2h5TdKcnlzuMYHDfBFr8WuN0/H\nXSdS2DRcFQKBgHXCWOTRMSrDQK42iUBD6dubwg6Hd2CMKArVawYP7a+YgHbV24H/\nQXkiVCsPVLXnBFJGP+MSFYmmAbPyxbkSuAeYcH75acZgV1wVZ4OoHIZfVtWoBzLR\n+/hi8L3GuIwVNrJPex2n+taWivUdVq5FBNe3HpmMAzIMobsncWInGVP5AoGBAKGR\nXnIE50j5T0K7Jw3syzTkJ56nEiZWSWhMU98kj9XYqkSC0ECeAA0Y9Udy1nlt4RM0\nuJPMSMGy+mN1p426UpaIy1jb1OfTgZpC2+fMGufmsUOr+YNDnipHcpcHLa/MsZkm\nLDOWqI3No6QPHZQJV5T881ln9nKAus70gzSDifHtAoGBAI6L/8RXh/9TSqBs8QXV\nyWYIPrOfAVXQnbxMSlbFP/9Y4VDyDOtWLU577VEPpzzr9on54D6grcxH50kyruA1\np0nio67uyRdgGqOCbEKDpeI7fDWLZ4DeCcaGn8i78gXylSey6rG5NTbKCqSDMDlX\nKzWiIoOL1qfCWhjHAWzY52Pb\n-----END PRIVATE KEY-----\n"
}
#-------------------------------------------------------------------------------
#Defines firebase account client email
variable "pigeons_firebase_account_client_email" {
  type = string
  default = "firebase-adminsdk-2mrcb@comfortech-12a15.iam.gserviceaccount.com"
}
#-------------------------------------------------------------------------------
#Defines firebase account client id
variable "pigeons_firebase_account_client_id" {
  type = string
  default = "104778641386557489050"
}
#-------------------------------------------------------------------------------
#Defines firebase account auth url
variable "pigeons_firebase_account_auth_url" {
  type = string
  default = "https://accounts.google.com/o/oauth2/auth"
}
#-------------------------------------------------------------------------------
#Defines firebase account token uri
variable "pigeons_firebase_account_token_uri" {
  type = string
  default = "https://oauth2.googleapis.com/token"
}
#-------------------------------------------------------------------------------
#Defines firebase account provider x509 cert url
variable "pigeons_firebase_account_auth_provider_x509_cert_url" {
  type = string
  default = "https://www.googleapis.com/oauth2/v1/certs"
}
#-------------------------------------------------------------------------------
#Defines firebase account client x509 cert url
variable "pigeons_firebase_account_auth_client_x509_cert_url" {
  type = string
  default = "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-2mrcb%40comfortech-12a15.iam.gserviceaccount.com"
}
#-------------------------------------------------------------------------------
#Defines firebase default message title
variable "pigeons_firebase_default_message_title" {
  type = string
  default = "Comfortech"
}
#-------------------------------------------------------------------------------
#Defines firebase default message body
variable "pigeons_firebase_default_message_body" {
  type = string
  default = "Empty message"
}
#-------------------------------------------------------------------------------
#Defines firebase default message image uri
variable "pigeons_firebase_default_message_image_uri" {
  type = string
  default = "https://sun1-26.userapi.com/s/v1/if1/2Dhrl9gqlWW7XVRbXiBRdtduvtw4PTiYRE0K9A9qVfypNzoERhBxUj_ch5VP6-RBWSyvQ9_q.jpg?size=400x0&quality=96&crop=108,115,484,484&ava=1"
}
#-------------------------------------------------------------------------------
#Defines firebase registration token
variable "pigeons_firebase_registration_token" {
  type = string
  default = "AIzaSyCf5LhHwWcWWgjKCHv1I32lko6QusPty-I"
}
#-------------------------------------------------------------------------------
#Defines pigeons db password
variable "pigeons_db_password" {
  type = string
  default = "PoI456ZxC"
}