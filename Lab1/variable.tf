variable "docker_image"{
    type = string
}

variable "memory"{
    type = number
}

variable "priviledged"{
    type = bool
}

variable "number_of_container"{
    type = number
}

variable "port"{
    type = object({
        inter = number
        ext = number
    }) 
}