provider "local" {}

resource "local_file" "hello" {
    content = var.file_content
    filename = "hello.txt"
}

variable "file_content" {
    description = "file contents of txt file"
    default = "Hello, Platform Academy 2023"
}