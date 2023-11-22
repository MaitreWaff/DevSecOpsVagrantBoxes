resource "time_static" "time_update" {
}

 resource "local_file" "time" {
     filename = "/root/time.txt"
     content = "Time stamp of this file is <${time_static.time_update.id} from time_update"
}
