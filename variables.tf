variable "id_rsa" {
  type = string
  sensitive = true
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCp/P3u2wU2susc5jQFxxqh6T6GjfHp8+qTk1WDGxMcs6qv8fc6X7t/oJfh64+rAduytXOVRsypxlrihBwK9QlAze/k+0HGyncufYoU2ShxIHd2CY/IJh9r/h4vDKmNhBVeAJJizyJTaO621US3xn42MqsRwjdK/xacnbw+asb9Jdq9i2QZWmLDhe69xBJi+nev88/5eIcRfgvENWWP3Sg1YBA/DTAq5dM8xn2R+Fpx+QF9HSu7ATfs18058d2cjcGuaz8fyU4+Jt6gWVFK7xByx0c5ie4iCzsFd8AGnQCAdfiCplrh1TmGv4vTOpCf1QPT6bq5a9T9mmmVj5Cu0GVKSlAwn9aaGLOfwxuuLNh1z/DfiqC8/a9AmDtyQGkR3VqmDw+Cw+uvUIXhPJ65yIw6P3oBUAy4iCp9YGAWPEpPvuskGL7dwJn/TDSsibXmzqUgU9ej0gOQdOnySrzJBs84AY7IPT5UtD8dIep6fwu9pAeWBNFETeDMep8hVFkdJpE= kishan@LAPTOP-DNOFI1G0"
}

variable "key_name" {
   type = string
   default = "ec2key.pem"
}