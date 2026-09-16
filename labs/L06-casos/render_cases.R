# Render all 16 plant x model one-page cases and combine them into a
# single printable booklet. Run with working directory set to
# labs/L06-casos/, after 00-prepare.R has produced data.rds/fits.rds.

if (!requireNamespace("quarto", quietly = TRUE)) {
  stop("Package 'quarto' is required: install.packages('quarto')")
}
if (!requireNamespace("pdftools", quietly = TRUE)) {
  stop("Package 'pdftools' is required: install.packages('pdftools')")
}

plants <- paste0("plant_", 1:4)
models <- c("poisson", "nbinom2", "zip", "zinb")
combos <- expand.grid(plant = plants, model = models, stringsAsFactors = FALSE)
combos <- combos[order(combos$plant, match(combos$model, models)), ]

pages_dir <- "output/pages"
dir.create(pages_dir, recursive = TRUE, showWarnings = FALSE)

page_files <- character(nrow(combos))

for (i in seq_len(nrow(combos))) {
  plant <- combos$plant[i]
  model <- combos$model[i]
  out_file <- sprintf("%s_%s.pdf", plant, model)

  quarto::quarto_render(
    input = "case-template.qmd",
    execute_params = list(plant = plant, model = model),
    output_file = out_file,
    quiet = TRUE
  )

  dest <- file.path(pages_dir, out_file)
  file.rename(out_file, dest)
  page_files[i] <- dest
}

pdftools::pdf_combine(page_files, output = "output/casos-booklet.pdf")

cat("Wrote", length(page_files), "pages to", pages_dir, "\n")
cat("Combined booklet: output/casos-booklet.pdf\n")
