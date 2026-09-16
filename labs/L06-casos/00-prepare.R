# Simulate the L06 plant/distance data and fit all 16 plant x model
# combinations once, so the case handouts never need to refit models.
# Run this (with working directory set to labs/L06-casos/) before
# render_cases.R whenever the simulation changes.

suppressPackageStartupMessages({
  library(dplyr)
  library(tidyr)
  library(glmmTMB)
})

set.seed(2) # chosen so all 16 plant x model fits converge without warnings
n <- 50

# continuous predictor
distance <- runif(n, min = 0, max = 100)

# 1. Poisson: no distance effect
plant_1 <- rpois(n, lambda = 2)

# 2. Poisson: positive distance effect
mu2 <- exp(0.2 + 0.02 * distance)
plant_2 <- rpois(n, lambda = mu2)

# 3. Negative binomial: negative effect + overdispersion
mu3 <- exp(2.2 - 0.025 * distance)
plant_3 <- rnbinom(n, mu = mu3, size = 0.5)

# 4. Zero-inflated Poisson: positive effect + structural zeros
mu4 <- exp(-0.5 + 0.025 * distance)
z4 <- rbinom(n, 1, 0.45)
plant_4 <- z4 * rpois(n, lambda = mu4)

data_long <- tibble(
  plant_1 = plant_1,
  plant_2 = plant_2,
  plant_3 = plant_3,
  plant_4 = plant_4,
  distance = distance
) |>
  tidyr::pivot_longer(
    cols = starts_with("plant_"),
    names_to = "plant",
    values_to = "abundance"
  )

plant_colors <- setNames(
  RColorBrewer::brewer.pal(4, "Set2"),
  paste0("plant_", 1:4)
)

data_by_plant <- setNames(
  lapply(paste0("plant_", 1:4), function(p) data_long[data_long$plant == p, ]),
  paste0("plant_", 1:4)
)

model_families <- list(
  poisson = list(family = poisson, ziformula = ~0),
  nbinom2 = list(family = nbinom2, ziformula = ~0),
  zip = list(family = poisson, ziformula = ~1),
  zinb = list(family = nbinom2, ziformula = ~1)
)

fits <- list()
for (plant in names(data_by_plant)) {
  for (model in names(model_families)) {
    spec <- model_families[[model]]
    key <- paste(plant, model, sep = ".")
    fits[[key]] <- glmmTMB(
      abundance ~ distance,
      data = data_by_plant[[plant]],
      family = spec$family,
      ziformula = spec$ziformula
    )
  }
}

saveRDS(
  list(
    data_long = data_long,
    data_by_plant = data_by_plant,
    plant_colors = plant_colors
  ),
  "data.rds"
)
saveRDS(fits, "fits.rds")

cat("Saved data.rds and fits.rds with", length(fits), "fitted models.\n")
