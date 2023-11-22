resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content = "We love pets!"
  file_permission = "0700"
}
resource "local_file" "cat" {
  filename = "/root/cat.txt"
  content = "My favorite pet is Mr. Whiskers"
}
