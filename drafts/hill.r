com_A <- c(rep("A", 90), rep("B", 10))
com_B <- c(rep("A", 90), c("B", "C", "D", "E", "F", "G", "H", "I", "J", "K"))

# esfuerzo igual
length(com_A) == length(com_B)

# riqueza
riqueza_A <- length(unique(com_A))
riqueza_B <- length(unique(com_B))

# Shannon (D1)
calc_D1 <- function(x) {
  exp(-sum(prop.table(table(x)) * log(prop.table(table(x)))))
}

shan_A <- calc_D1(com_A)
shan_B <- calc_D1(com_B)

# Simpson (D2)

calc_D2 <- function(x) {
  1 / sum(prop.table(table(x))^2)
}

sim_A <- calc_D2(com_A)
sim_B <- calc_D2(com_B)

# comparacion

data.frame(
  metric = c("Riqueza", "Shannon", "Simpson"),
  A = c(riqueza_A, shan_A, sim_A),
  B = c(riqueza_B, shan_B, sim_B)
)
